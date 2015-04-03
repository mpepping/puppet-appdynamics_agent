# == appdynamics_agent::instance
#
# appdynamics_agent::instance{"instance name":}
define appdynamics_agent::instance (

  $instance         = $title,
  $version          = hiera('appdynamics_version', '3.9.1.0'),
  $installdir       = hiera('appdynamics_installdir', '/opt/appdynamics'),
  $appdynamics_host = hiera('appdynamics_host', 'appdynamics'),
  $appdynamics_port = hiera('appdynamics_port', '8181')

) {
  include appdynamics_agent::params

  anchor { 'appdynamics_agent::instance::begin':}
  -> Exec["appdynamics_appserveragent_unzip_${instance}"]
  -> Exec["appdynamics_machineagent_unzip_${instance}"]
  -> File["/etc/init.d/appdyn-machineagent-${instance}"]
  -> File["${installdir}/AppServerAgent-${instance}/conf/controller-info.xml"]
  -> File["${installdir}/MachineAgent-${instance}/conf/controller-info.xml"]
  -> Service["appdyn-machineagent-${instance}"]
  -> anchor { 'appdynamics_agent::instance::end': }


  exec { "appdynamics_appserveragent_unzip_${instance}":
    unless    => "/usr/bin/stat /opt/appdynamics/installed_appserveragent-${instance}-${version}",
    command   => "/usr/bin/unzip -n /opt/appdynamics/AppServerAgent-${version}.zip -d /opt/appdynamics/AppServerAgent-${instance}/ && touch /opt/appdynamics/AppServerAgent-${instance}-${version}-installed",
    creates   => "/opt/appdynamics/AppServerAgent-${instance}-${version}-installed",
    logoutput => true,
  }

  exec { "appdynamics_machineagent_unzip_${instance}":
    command => "/usr/bin/unzip -n /opt/appdynamics/MachineAgent-${version}.zip -d /opt/appdynamics/MachineAgent-${instance}/ && touch /opt/appdynamics/MachineAgent-${instance}-${version}-installed",
    creates => "/opt/appdynamics/MachineAgent-${instance}-${version}-installed"
  }

  file {"/etc/init.d/appdyn-machineagent-${instance}":
    ensure  => present,
    content => template('appdynamics_agent/appdyn_machineagent.sh.erb'),
    mode    => '0755',
    owner   => root,
    group   => root,
  }

  file {"${installdir}/AppServerAgent-${instance}/conf/controller-info.xml":
    ensure  => file,
    content => template('appdynamics_agent/controller-info.xml.erb'),
    owner   => 'appdyn',
    group   => 'appdyn',
    mode    => '0644',
  }

  file {"${installdir}/MachineAgent-${instance}/conf/controller-info.xml":
    ensure  => file,
    content => template('appdynamics_agent/controller-info.xml.erb'),
    owner   => 'appdyn',
    group   => 'appdyn',
    mode    => '0644',
  }

  service { "appdyn-machineagent-${instance}":
    ensure => running,
    enable => true,
    status => "pgrep -f machineagent.jar | grep ${instance}",
  }

}


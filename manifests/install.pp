# Class appdynamics_agent::install
#
class appdynamics_agent::install {

  Package {  schedule => always }

  package {'appdynamics':
    ensure   => "appdynamics-${appdynamics_agent::version}",
    provider => rpm,
    source   => "puppet:///modules/appdynamics_agent/appdynamics-${appdynamics_agent::version}.noarch.rpm",
  }

  file {'/etc/init.d/appd_machineagent':
    ensure => present,
    source => 'puppet:///modules/appdynamics_agent/appd_machineagent',
    mode   => '0755',
    owner  => root,
    group  => root,
  }
}

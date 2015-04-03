# Class appdynamics_agent::install
#
class appdynamics_agent::install (
  $version  = $appdynamics_agent::params::version
){


  anchor { 'appdynamics_agent::install::begin':}
  -> File['appdynamics_appserveragent']
  -> File['appdynamics_machineagent']
  -> Appdynamics_agent::Instance['foo']
  -> anchor { 'appdynamics_agent::install::end': }


  file {'appdynamics_appserveragent':
    ensure => present,
    path   => "/opt/appdynamics/AppServerAgent-${version}.zip",
    source => "puppet:///modules/appdynamics_agent/AppServerAgent-${version}.zip",
    mode   => '0644',
    owner  => appdyn,
    group  => appdyn,
  }

  file {'appdynamics_machineagent':
    ensure => present,
    path   => "/opt/appdynamics/MachineAgent-${version}.zip",
    source => "puppet:///modules/appdynamics_agent/MachineAgent-${version}.zip",
    mode   => '0644',
    owner  => appdyn,
    group  => appdyn,
  }

  appdynamics_agent::instance {'foo':}

}

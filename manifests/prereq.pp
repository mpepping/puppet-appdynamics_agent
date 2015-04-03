# Class appdynamics_agent::prereq
#
class appdynamics_agent::prereq (
  $version  = $appdynamics_agent::params::version
){

  anchor { 'appdynamics_agent::prereq::begin': } ->
    Group['appdyn'] ->
    User['appdyn'] ->
    File['/opt/appdynamics'] ->
    File['appdynamics_appserveragent'] ->
    File['appdynamics_machineagent'] ->
  anchor { 'appdynamics_agent::prereq::end': }


  group { 'appdyn':
    ensure => present,
    gid    => 1105,
  }

  user { 'appdyn':
    ensure  => present,
    uid     => 1105,
    comment => 'AppDynamics',
    home    => '/opt/appdynamics',
    gid     => 1105,
    shell   => '/sbin/nologin',
  }

  file {'/opt/appdynamics':
    ensure => directory,
    owner  => 'appdyn',
    group  => 'appdyn',
  }

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
}

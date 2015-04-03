# Class appdynamics_agent::prereq
#
class appdynamics_agent::prereq {

  anchor { 'appdynamics_agent::prereq::begin': } ->
    Group['appdyn'] ->
    User['appdyn'] ->
    File['/opt/appdynamics'] ->
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
}

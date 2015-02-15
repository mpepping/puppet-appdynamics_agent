# Class appdynamics_agent::prereq
#
class appdynamics_agent::prereq {

  anchor { 'appdynamics_agent::prereq::begin': } ->
    Group['appdynamics'] ->
    User['appdynamics'] ->
    File['/opt/appdynamics'] ->
    File['/opt/appdynamics/machineagent'] ->
    File['/opt/appdynamics/appagent'] ->
  anchor { 'appdynamics_agent::prereq::end': }


  group { 'appdynamics':
    ensure => present,
    gid    => 5900,
  }

  user { 'appdynamics':
    ensure     => present,
    uid        => 5900,
    comment    => 'AppDynamics',
    home       => '/opt/appdynamics',
    gid        => 5900,
    shell      => '/sbin/nologin',
    managehome => true,
  }

  file {'/opt/appdynamics':
    ensure => directory,
    owner  => appdynamics,
    group  => appdynamics,
  }

  file {'/opt/appdynamics/machineagent':
    ensure  => directory,
    owner   => appdynamics,
    group   => appdynamics,
    recurse => true,
  }

  file {'/opt/appdynamics/appagent':
    ensure  => directory,
    owner   => appdynamics,
    group   => $appdynamics_agent::appgroup,
    mode    => '0664',
    recurse => true,
  }
}

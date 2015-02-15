# Class appdynamics_agent::config
#
class appdynamics_agent::config {

  anchor { 'appdynamics_agent::config::begin': } ->
    File['/opt/appdynamics/appagent/conf/controller-info.xml'] ->
    File['/opt/appdynamics/machineagent/conf/controller-info.xml'] ->
  anchor { 'appdynamics_agent::config::end': }

  
  file {'/opt/appdynamics/appagent/conf/controller-info.xml':
    ensure  => file,
    content => template('appdynamics_agent/controller-info.xml.erb'),
    owner   => appdynamics,
    group   => appdynamics,
    mode    => '0644',
    notify  => Service['appdynamics_machineagent'],
  }

  file {'/opt/appdynamics/machineagent/conf/controller-info.xml':
    ensure  => file,
    content => template('appdynamics_agent/controller-info.xml.erb'),
    owner   => appdynamics,
    group   => appdynamics,
    mode    => '0644',
    notify  => Service['appd_machineagent'],
  }
}

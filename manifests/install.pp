# Class appdynamics_agent::install
#
class appdynamics_agent::install {

  $instances = ['foo', 'bar']
  appdynamics_agent::instance {$instances:}

}

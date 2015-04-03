# Class appdynamics_agent::params
#
class appdynamics_agent::params {

  $version           = hiera('appdynamics_version', '3.9.1.0')
  $installdir        = hiera('appdynamics_installdir', '/opt/appdynamics')

  $appdynamics_host  = hiera('appdynamics_host', 'appdynamics')
  $appdynamics_port  = hiera('appdynamics_port', '8181')

}

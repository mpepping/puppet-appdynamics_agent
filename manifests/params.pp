# Class appdynamics_agent::params
#
class appdynamics_agent::params {

  $version           = '1.0.0'
  $appgroup          = 'fooapp'
  $hostname          = $::hostname
  $appdynamics_host  = hiera('appdynamics_host')

}


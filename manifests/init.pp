# === Class: appdynamics_agent
#
# Puppet class for the appdynamics machineagent
#
# Initial release : Leon de Jager (ldejager)
# Refactoring     : Martijn Pepping (mpepping)
#
# === Parameters
#
# The following parameters needs to be passed to the class:-
#
# $version  - Version of the application that needs to be installed (RPM).
# $appgroup - Group that the appdynamics installation dir needs to be set to.
#
# === Examples
#
#  class { 'appdynamics_agent':
#    version  => '3.15.0',
#    appgroup => 'group'
#  }
#

class appdynamics_agent () {
  
  include appdynamics_agent::params

  case $::operatingsystem {
    'RedHat', 'CentOS': {

        anchor{'appdynamics_agent::begin'}
        -> class{'appdynamics_agent::prereq':}
        -> class{'appdynamics_agent::install':}
        -> class{'appdynamics_agent::config':}
        ~> class{'appdynamics_agent::service':}
        -> anchor{'appdynamics_agent::end'}
      }
    default: { notify { 'OS not supported for this class':}
    }
  }
}

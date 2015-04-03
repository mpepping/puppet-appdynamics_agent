# === Class: appdynamics_agent
#
# Puppet class for the appdynamics machineagent
#
#   Martijn Pepping (mpepping)
#
# === Parameters
#
# The following parameters needs to be passed to the class:
#
#   $version  - Version of the AppDynamics agent that is used.
#
# === Examples
#
#  class { 'appdynamics_agent':
#    version  => '3.15.0',
#  }
#

class appdynamics_agent (
) {

  include 'appdynamics_agent::params'

  case $::osfamily {
    'RedHat': {

      anchor{ 'appdynamics_agent::begin': }
      -> class{ 'appdynamics_agent::prereq': }
      -> class{ 'appdynamics_agent::install': }
      -> anchor{ 'appdynamics_agent::end': }

    }
    default: {
      notify { 'OS not supported for this class':}
    }
  }
}


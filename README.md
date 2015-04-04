AppDynamics
===========

[![Build Status](https://travis-ci.org/mpepping/puppet-appdynamics_agent.svg?branch=master)](https://travis-ci.org/mpepping/puppet-appdynamics_agent)


* AppDynamics Puppet Module
* AppDynamics Machine Agent init script
* AppDynamics Monitoring Extentions


Usage 
-----

Class is instantiated via a host defintion or puppet ENC.

    class { 'appdynamics_agent': 
      version => '3.9.1.0', 
      appgroup => 'java-app-x' 
    }



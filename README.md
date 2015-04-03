AppDynamics
===========


* AppDynamics Puppet Module
* AppDynamics Machine Agent init script
* AppDynamics Monitoring Extentions


Usage 
-----

Class is instantiated via a host defintion or puppet ENC.

* class { 'appdynamics': version => '3.7.15-0', appgroup => 'group' }

The templates referred to in the init.pp are the standard configuration files, which have some spesific environment variables set via puppets ruby syntax, i.e.

* <tier-name><%= @system_role  %></tier-name>


# pcp_broker - Used for managing installation and configuration
# of pcp_broker (http://pcp_broker.org/)
#
# @example
#   include pcp_broker
#
# @example
#   class { 'pcp_broker':
#     manage_repo    => false,
#     package_name   => 'pcp_broker-custombuild',
#   }
#
# @author Peter Souter
#
# @param manage_package [Boolean] Whether to manage the pcp_broker package
#
# @param manage_repo [Boolean] Whether to manage the package repositroy
#
# @param package_name [String] Name of the pcp_broker package
#
# @param package_version [String] Version of the pcp_broker package to install
#
# @param service_ensure [String] What status the service should be enforced to
#
# @param service_name [String] Name of the pcp_broker service to manage
#
class pcp_broker (
  $manage_package   = $::pcp_broker::params::manage_package,
  $manage_repo      = $::pcp_broker::params::manage_repo,
  $maxstartups      = $::pcp_broker::params::maxstartups,
  $package_name     = $::pcp_broker::params::package_name,
  $package_version  = $::pcp_broker::params::package_version,
  $port             = $::pcp_broker::params::port,
  $service_ensure   = $::pcp_broker::params::service_ensure,
  $service_name     = $::pcp_broker::params::service_name,
) inherits ::pcp_broker::params {

  validate_bool($manage_package)
  validate_bool($manage_repo)

  validate_string($package_name)
  validate_string($package_version)
  validate_string($service_ensure)
  validate_string($service_name)

  class { '::pcp_broker::install': } ->
  class { '::pcp_broker::config': } ~>
  class { '::pcp_broker::service': } ->
  Class['::pcp_broker']
}

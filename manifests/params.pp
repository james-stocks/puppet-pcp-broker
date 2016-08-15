# == Class pcp_broker::params
#
# This class is meant to be called from pcp_broker.
# It sets variables according to platform.
#
class pcp_broker::params {
  case $::osfamily {
    'Debian': {
      $package_name = 'pcp_broker'
      $service_name = 'pcp_broker'
    }
    'RedHat', 'Amazon': {
      $package_name = 'pcp_broker'
      $service_name = 'pcp_broker'
    }
    default: {
      fail("${::osfamily} not supported")
    }
  }

  # Defaults for all Operating Systems
  $manage_package   = true
  $manage_repo      = true
  $manage_service   = true
  $package_version  = 'installed'
  $service_ensure   = 'running'
}

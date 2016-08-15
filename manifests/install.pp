# == Class pcp_broker::install
#
# This class is called from pcp_broker for install.
#
class pcp_broker::install {

  if $::pcp_broker::manage_package {
    package { $::pcp_broker::package_name:
      ensure => $::pcp_broker::package_version,
    }
  }
}

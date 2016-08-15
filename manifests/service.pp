# == Class pcp_broker::service
#
# This class is meant to be called from pcp_broker.
# It ensure the service is running.
#
class pcp_broker::service {

  if $::pcp_broker::manage_service {
    service { $::pcp_broker::service_name:
      ensure     => $::pcp_broker::service_ensure,
    }
  }

}

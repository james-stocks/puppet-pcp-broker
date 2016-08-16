# == Class pcp_broker::config
#
# This class is called from pcp_broker for service config.
#
class pcp_broker::config {

  hocon_setting { 'nrepl port':
    ensure  => present,
    path    => "${::pcp_broker::git_clone_dir}/pcp-broker/test-resources/conf.d/nrepl.conf",
    setting => 'nrepl.port',
    value   => $::pcp_broker::nrepl_port,
    type    => 'number',
  }

  hocon_setting { 'broker ssl port':
    ensure  => present,
    path    => "${::pcp_broker::git_clone_dir}/pcp-broker/test-resources/conf.d/webserver.conf",
    setting => 'webserver.pcp-broker.ssl-port',
    value   => $::pcp_broker::port,
    type    => 'number',
  }

  hocon_setting { 'broker ssl cert':
    ensure  => present,
    path    => "${::pcp_broker::git_clone_dir}/pcp-broker/test-resources/conf.d/webserver.conf",
    setting => 'webserver.pcp-broker.ssl-cert',
    value   => $::pcp_broker::ssl_cert,
    type    => 'text',
  }

  hocon_setting { 'broker ssl key':
    ensure  => present,
    path    => "${::pcp_broker::git_clone_dir}/pcp-broker/test-resources/conf.d/webserver.conf",
    setting => 'webserver.pcp-broker.ssl-key',
    value   => $::pcp_broker::ssl_key,
    type    => 'text',
  }

  hocon_setting { 'broker ssl ca cert':
    ensure  => present,
    path    => "${::pcp_broker::git_clone_dir}/pcp-broker/test-resources/conf.d/webserver.conf",
    setting => 'webserver.pcp-broker.ssl-ca-cert',
    value   => $::pcp_broker::ssl_ca_cert,
    type    => 'text',
  }

  hocon_setting { 'broker ssl crl path':
    ensure  => present,
    path    => "${::pcp_broker::git_clone_dir}/pcp-broker/test-resources/conf.d/webserver.conf",
    setting => 'webserver.pcp-broker.ssl-crl-path',
    value   => $::pcp_broker::ssl_crl_path,
    type    => 'text',
  }
}

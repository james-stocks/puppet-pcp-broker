# == Class pcp_broker::params
#
# This class is meant to be called from pcp_broker.
#
class pcp_broker::params {

  $git_url          = 'https://github.com/puppetlabs/pcp-broker'
  $git_clone_dir    = '/opt/puppet-git-repos'
  $port             = '8142'
  $nrepl_port       = '7888'
  $log_dir          = '/var/log/puppetlabs'
  $log_filename     = 'pcp-broker.log'
}

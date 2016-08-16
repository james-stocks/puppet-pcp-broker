# pcp_broker - Used for fetching pcp-broker (https://github.com/puppetlabs/pcp-broker)
# and running it with trapperkeeper
#
# @example
#   include pcp_broker
#
# @author James Stocks
#
# @param git_url [String] URL to the pcp-broker repo
#
# @param git_clone_dir [String] the local folder to clone the pcp-broker repo to
#
# @param port [String] Port number that pcp-broker should use for PCP messaging
#                      (needs to be unique if running multiple instances on one host)
#
# @param nrepl_port [String] Port number for pcp-broker's nrepl instance
#                            (needs to be unique if running multiple instances on one host)
#
class pcp_broker (
  $git_url          = $::pcp_broker::params::git_url,
  $git_clone_dir    = $::pcp_broker::params::git_clone_dir,
  $port             = $::pcp_broker::params::port,
  $nrepl_port       = $::pcp_broker::params::nrepl_port,
  $log_dir          = $::pcp_broker::params::log_dir,
  $log_filename     = $::pcp_broker::params::log_filename,
) inherits ::pcp_broker::params {

  validate_string($git_url)
  validate_string($git_clone_dir)
  validate_string($port)
  validate_string($nrepl_port)
  validate_string($log_dir)
  validate_string($log_filename)

  class { '::pcp_broker::clone': } ->
  class { '::leiningen': } ->
  class { '::pcp_broker::config': } ~>
  class { '::pcp_broker::trapperkeeper': } ->
  Class['::pcp_broker']
}

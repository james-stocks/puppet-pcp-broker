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
# @param log_dir [String] Directory to put pcp-broker log in
#
# @param log_filename [String] Filename to have pcp-broker log to
#
# @param ssl_cert [String] path to the broker's SSL cert. Allows running with your own SSL file set.
#
# @param ssl_key [String] path to the broker's SSL key. Allows running with your own SSL file set.
#
# @param ssl_ca_cert [String] path to the broker's CA cert. Allows running with your own SSL file set.
#
# @param ssl_crl_path [String] path to the broker's CRL file. Allows running with your own SSL files.
#
# @param run_broker [boolean] Whether Puppet should ensure this instance of the broker is running.
#                             Set to false to just configure the broker without starting it.
#
class pcp_broker (
  $git_url          = $::pcp_broker::params::git_url,
  $git_clone_dir    = $::pcp_broker::params::git_clone_dir,
  $port             = $::pcp_broker::params::port,
  $nrepl_port       = $::pcp_broker::params::nrepl_port,
  $log_dir          = $::pcp_broker::params::log_dir,
  $log_filename     = $::pcp_broker::params::log_filename,
  $ssl_cert         = $::pcp_broker::params::ssl_cert,
  $ssl_key          = $::pcp_broker::params::ssl_key,
  $ssl_ca_cert      = $::pcp_broker::params::ssl_ca_cert,
  $ssl_crl_path     = $::pcp_broker::params::ssl_crl_path,
  $run_broker       = $::pcp_broker::params::run_broker,
) inherits ::pcp_broker::params {

  validate_string($git_url)
  validate_string($git_clone_dir)
  validate_string($port)
  validate_string($nrepl_port)
  validate_string($log_dir)
  validate_string($log_filename)
  validate_string($ssl_cert)
  validate_string($ssl_key)
  validate_string($ssl_ca_cert)
  validate_string($ssl_crl_path)
  validate_bool($run_broker)

  class { '::pcp_broker::clone': } ->
  class { '::leiningen': } ->
  class { '::pcp_broker::config': } ->
  class { '::pcp_broker::trapperkeeper': } ->
  Class['::pcp_broker']
}

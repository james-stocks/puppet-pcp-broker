# == Class pcp_broker::trapperkeeper
#
# This class is meant to be called from pcp_broker.
# It ensures the broker is running in trapperkeeper
#
class pcp_broker::trapperkeeper {
  if $::pcp_broker::run_broker {
    file { $::pcp_broker::log_dir:
      ensure => directory,
    }

    exec { 'lein tk':
      command     => "${::leiningen::bin_dir}/lein tk < /dev/null > ${::pcp_broker::log_dir}/${::pcp_broker::log_filename} 2>&1 &",
      cwd         => "${::pcp_broker::git_clone_dir}/pcp-broker",
      environment => 'LEIN_ROOT=ok',
    }
  }
}

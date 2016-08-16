# == Class pcp_broker::clone
#
# This class is called from pcp_broker for git cloning.
#
class pcp_broker::clone {

  package { 'git':
    ensure => present,
  }

  vcsrepo { "${::pcp_broker::git_clone_dir}/pcp-broker":
    ensure   => present,
    provider => git,
    source   => $::pcp_broker::git_url,
    revision => 'master',
  }
}

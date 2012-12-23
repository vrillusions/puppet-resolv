# == Class: resolv
#
# Updates the /etc/resolv.conf file.
#
# === Parameters
#
# [*nameservers*]
#   Array of name servers to use. Defaults to google's public dns servers.
#
# [*search*]
#   Search domain to use for short host names.  Defaults to the domain facter.
#
# === Examples
#
#  class { 'resolv':
#    search      => 'example.com',
#    nameservers => ['1.2.3.4', '4.5.6.7'],
#  }
#
class resolv (
    $search = $::domain,
    $nameservers = [ '8.8.8.8', '8.8.4.4' ],
  ) {

  file { '/etc/resolv.conf':
    ensure  => file,
    owner   => 'root',
    group   => 'root',
    mode    => '0644',
    content => template('resolv/resolv.conf.erb'),
  }

  # Later versions of Ubuntu (and probable debian) use resolvconf.  Need to
  # make sure resolvconf package isn't installed or it may overwrite ours.
  package { 'resolvconf':
    ensure => absent,
  }
}

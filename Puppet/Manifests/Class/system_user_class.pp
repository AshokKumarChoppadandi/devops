class system_user_class {
  user { 'bob':
    ensure     => 'present',
    comment    => 'User Bob',
    home       => '/home/bob',
    managehome => 'true',
    password   => '$1$X95v5HCs$7r.ro77pUryLdVjsqOYTq0',
    groups      => ['wheel'],
  }

  package { 'vim':
    ensure => 'present',
  }

  file { '/home/bob/.vimrc':
    ensure => file,
    # This will copy the file from Puppet Master to Puppet Agent
    # This file should be present on Puppet Master at location: 
    # /etc/puppetlabs/code/modules/production/files/
    source => 'puppet:///modules/production/vimrc',
  }
}

# https://docs.puppet.com/puppet/latest/type.html

node puppetagent3 {
  file { '/home/bigdata/Test.txt':
    # Creates an empty file
    ensure  => 'file',
    content => 'Hi, This line is from Puppet',
    owner   => 'bigdata',
    group   => 'bigdata',
    mode    => '0755',
  }
}

# Set up regular Puppet runs
file { '/usr/local/bin/run-puppet':
  source => '/etc/puppet/files/run-puppet.sh',
  mode   => '0755',
}

cron { 'run-puppet':
  command => '/usr/local/bin/run-puppet',
  hour    => '*',
  minute  => '*/15',
}

package { 'apache2':
  ensure => present,
}

file { '/var/www':
  ensure => directory,
}

file { '/var/www/html':
  ensure => directory,
}

file { '/var/www/html/index.html':
  ensure => file,
  source => '/etc/puppetlabs/puppet/files/index.html',
}


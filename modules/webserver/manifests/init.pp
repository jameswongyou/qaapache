class webserver {

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
  source => 'puppet:///modules/webserver/index.html',
}

file { '/etc/apache2/apache2.conf':
  ensure => file,
  owner => 'root',
  group => 'root',
  source => 'puppet:///modules/webserver/apache2.conf',
  require => Package['apache2'],
}

service { 'apache2':
  ensure => running,
  subscribe => File['/etc/apache2/apache2.conf'],
}


}

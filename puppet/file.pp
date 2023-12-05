file { 'manage directory /home/vagrant/work':
  ensure => 'directory',
  path   => '/home/vagrant/work',
}

case $facts['os']['distro']['codename'] {
  'jammy': { $content = 'jammy' }
  'focal': { $content = 'focal' }
  default: { fail("codename must be jammy or focal but got: ${facts['os']['distro']['codename']}") }
}

file { 'manage file /home/vagrant/work/my_file.txt':
  ensure  => 'file',
  path    => '/home/vagrant/work/my_file.txt',
  content => $content,
  require => File['manage directory /home/vagrant/work'],
}

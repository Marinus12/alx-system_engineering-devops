# Puppet manifest to configure SSH client

# Install package 'openssh-client' if necessary
package { 'openssh-client':
  ensure => installed,
}

# Ensure the SSH client configuration directory exists
file { '/etc/ssh':
  ensure => directory,
}

# Confighre SSH client to use the private key ~/.ssh/school
file_line { 'Declare identity file':
  ensure  => present,
  path    => '/etc/ssh/ssh_config',
  line    => 'IdentityFile ~/.ssh/school',
}

# Configure SSH client to refuse to authenticate  using a password
file_line { 'Turn off passwd auth':
  ensure => present,
  path   => '/etc/ssh/ssh_config',
  line   => 'PasswordAuthentication no',
}

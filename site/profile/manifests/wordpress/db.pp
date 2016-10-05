class profile::wordpress::db {
  include profile::linux::selinux

  class { '::mysql::server':
    root_password           => lookup('wordpress_passwd'),
    remove_default_accounts => true,
    override_options        => {
      mysqld => {'bind-address' => '0.0.0.0'},
    },
  }
  
  mysql::db { 'wordpress':
    user     => lookup('wordpress_username'),
    password => lookup('wordpress_passwd'),
    host     => '%',
    grant    => ['ALL'],
  }

}

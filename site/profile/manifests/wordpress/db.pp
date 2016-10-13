class profile::wordpress::db {
  include profile::linux::selinux

  class { '::mysql::server':
    root_password           => lookup('wordpress_passwd'),
    remove_default_accounts => true,
    override_options        => {
      mysqld => {'bind-address' => '0.0.0.0'},
    },
  }
  
/*
  file { '/var/tmp/wordpress.sql':
    ensure => file,
    source => 'https://s3-us-west-1.amazonaws.com/coolnick/wordpress.sql',
    before => Mysql::Db['wordpress'],
  }
*/
  
  mysql::db { 'wordpress':
    user     => lookup('wordpress_username'),
    password => lookup('wordpress_passwd'),
    grant    => ['ALL'],
    host     => '%',
#    sql      => '/var/tmp/wordpress.sql',
  }

}

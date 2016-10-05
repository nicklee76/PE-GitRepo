class profile::wordpress::app (
  $db_host,
) {
  package { 'wget':
    ensure => present,
    before => Wordpress::Instance::App['/opt/wordpress'],
  }
  
  wordpress::instance::app { '/opt/wordpress':
    install_dir          => '/opt/wordpress',
    install_url          => 'http://wordpress.org',
    version              => '3.8',
    db_name              => 'wordpress',
    db_host              => $db_host,
    db_user              => lookup('wordpress_username'),
    db_password          => lookup('wordpress_passwd'),
    wp_owner             => 'root',
    wp_group             => '0',
    wp_lang              => '',
    wp_config_content    => undef,
    wp_plugin_dir        => 'DEFAULT',
    wp_additional_config => 'DEFAULT',
    wp_table_prefix      => 'wp_',
    wp_proxy_host        => '',
    wp_proxy_port        => '',
    wp_multisite         => false,
    wp_site_domain       => '',
    wp_debug             => false,
    wp_debug_log         => false,
    wp_debug_display     => false,
  }
}

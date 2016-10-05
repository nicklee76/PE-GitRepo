class profile::master{
  class { 'hiera':
    eyaml     => true,
    hierarchy => [
      'nodes/%{::clientcert}',
      'environments/%{::environment}',
      'common',
    ],
  }
}

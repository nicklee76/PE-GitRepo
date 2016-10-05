class cloudpassage(
  $apikey,
  $tags = $::operatingsystem,
) {

  # if you have your own apt/yum module you can comment these out
  # I recommends puppetlabs-apt for apt
  case $::operatingsystem {
    /(?i:debian|ubuntu)/:        { include cloudpassage::apt }
    /(?i:redhat|centos|fedora)/: { include cloudpassage::yum }
    default: {}
  }

  include cloudpassage::install, cloudpassage::config, cloudpassage::service

  Class['cloudpassage::install'] ~> Class['cloudpassage::config'] ~> Class['cloudpassage::service']

}

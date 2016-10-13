# Cloud Passage agent installation module
# agentkey = the agent registration key you use to register the node
# tags = facts or values to use as tags for this node, if empty, tags will not be set
# managerepos = set to true by default, will add cloudpassage package repo for install

class cloudpassage(
  $agentkey,
  $tags = undef,
  $serverlabel = "TEST",
  $managerepos = true,
) {

  if $managerepos == true {
    case $::operatingsystem {
      /(?i:debian|ubuntu)/:        { include cloudpassage::apt }
      /(?i:redhat|centos|fedora)/: { include cloudpassage::yum }
      default: {}
    }
  }

  include cloudpassage::install, cloudpassage::config, cloudpassage::service

  Class['cloudpassage::install'] ~> Class['cloudpassage::config'] ~> Class['cloudpassage::service']

}

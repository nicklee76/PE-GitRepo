class profile::cphalo {
  class { 'cloudpassage':
    agent_key => lookup('agent_key'),
    tags      => $::server_role,
  }
}

class profile::cphalo {
  class { 'cloudpassage':
    agentkey     => lookup('agent_key'),
    tags         => $::server_role,
    serverlabel  => "TEST-1",
  }
}

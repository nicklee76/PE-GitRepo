class profile::cphalo {
  class { 'cloudpassage':
    agentkey     => lookup('agent_key'),
    tags         => $::server_role,
    server_label => $::server_label,
  }
}

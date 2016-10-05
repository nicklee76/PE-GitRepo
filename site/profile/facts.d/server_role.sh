#!/bin/bash
VAR=$(/opt/puppetlabs/bin/puppet config print certname --section agent | awk -F - '{print $1}')
echo server_role=$VAR

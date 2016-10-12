#!/bin/bash
VAR=$(/opt/puppetlabs/bin/puppet config print certname --section agent')
echo server_label=$VAR

#!/bin/bash
VAR=$(/opt/puppetlabs/bin/puppet config print certname --section agent')
echo serverlabel=$VAR

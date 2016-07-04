#!/bin/bash

service neutron-server restart
service neutron-dhcp-agent restart
service neutron-l3-agent restart
service neutron-metadata-agent restart

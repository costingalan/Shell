#!/bin/bash

#ovs-vsctl add-port br-ex enp0s25
ifconfig enp0s25 0
ifconfig br-ex 192.168.133.229/24 up
route add default gw 192.168.133.1 br-ex


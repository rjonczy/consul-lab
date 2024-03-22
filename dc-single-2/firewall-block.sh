#!/bin/bash

echo "drop 8304/tcp"
sudo iptables -A INPUT -p tcp --dport 8304 -j DROP

echo "drop 8304/udp"
sudo iptables -A INPUT -p udp --dport 8304 -j DROP
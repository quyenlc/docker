#!/bin/bash

# Start services
sudo service sshd start
sudo service grafana-server start

# Keep container alive
tail -fn100 /dev/null
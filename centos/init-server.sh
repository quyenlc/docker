#!/bin/bash

sudo service sshd start
# Keep container alive
tail -fn100 /dev/null

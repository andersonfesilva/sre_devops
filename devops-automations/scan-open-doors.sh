#!/bin/bash
echo "Scanning open ports..."
netstat -tulpan | grep LISTEN
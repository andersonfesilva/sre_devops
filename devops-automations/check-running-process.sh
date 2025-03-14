#!/bin/bash
echo "Top 10 memory-consuming processes:"
ps aux --sort=-%mem | head -11
#!/bin/sh
clear
ab -n 1000 -c 100 http://localhost:8290/simple_api & 
cat benchmark.md

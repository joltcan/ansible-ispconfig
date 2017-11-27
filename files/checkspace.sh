#!/bin/bash

df -h | awk '{if(int($5)>95){print "disk "$6" is getting full: "$5}}'

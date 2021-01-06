#!/bin/bash
tail -2 output.txt | head -2 | awk 'match($0, /ami-.*/) { print substr($0, RSTART, RLENGTH) }' > ami.txt
aws s3 cp ami.txt s3://minecraft-vapp-artifacts/
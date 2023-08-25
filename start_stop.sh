#!/bin/bash

INSTANCE_ID="i-0d15b392f27070ba4"  # Replace with your instance ID

# Check instance status
INSTANCE_STATUS=$(aws ec2 describe-instances --instance-ids "$INSTANCE_ID" --query "Reservations[0].Instances[0].State.Name" --output text)

if [ "$INSTANCE_STATUS" == "running" ]; then
  # Instance is already running
  echo "Instance is already running..."
 # ssh -i path/to/key.pem ec2-user@public-ip "touch test.txt"
else
  # Instance is not running
  echo "Starting instance..."
  aws ec2 start-instances --instance-ids "$INSTANCE_ID"

  # Wait for status checks to pass
  # aws ec2 wait instance-status-ok --instance-ids "$INSTANCE_ID"

  # echo "Instance started. Instance 2/2 checks passed.."
  # ssh -i path/to/key.pem ec2-user@public-ip "touch hello.txt"
fi

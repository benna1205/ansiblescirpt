#!/bin/bash
#Checking the running instance
security_group_ids=$(aws ec2 describe-instances --filter "Name=instance-state-name,Values=running" --query "Reservations[*].Instances[*].SecurityGroups[*].GroupId" --output text)
# Checking which ports are enabled for each instance using security groups
for sg_id in $security_group_ids; do
     echo "Security Group ID: $sg_id"
ports=$(aws ec2 describe-security-groups --group-ids $sg_id | jq ".SecurityGroups[].IpPermissions[].FromPort")
echo "Ports enabled: $ports"
done

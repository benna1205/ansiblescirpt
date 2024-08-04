#!/bin/bash
#Checking which sg applied for Instance
aws ec2 describe-instances --filter "Name=instance-state-name,Values=running" --query "Reservations[*].Instances[*].SecurityGroups[*].GroupId" --output text
#Checking the which ports are for instance using sg
for sg_id in $security_group_ids; do
	    echo "Security Group ID: $sg_id"
i=$(aws ec2 describe-security-groups --group-ids $sg_id | jq ".SecurityGroups[].IpPermissions[].FromPort")
echo "which ports are enabled: $i"
done

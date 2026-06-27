#!/bin/bash
NEW_IP=$(curl -s https://checkip.amazonaws.com)
echo "Your current IP: $NEW_IP"

aws ec2 authorize-security-group-ingress \
  --group-id sg-00ef86a2a8bff8497 \
  --protocol tcp \
  --port 22 \
  --cidr ${NEW_IP}/32 \
  --region us-east-1 2>/dev/null || echo "Port 22 rule already exists"

aws ec2 authorize-security-group-ingress \
  --group-id sg-00ef86a2a8bff8497 \
  --protocol tcp \
  --port 6443 \
  --cidr ${NEW_IP}/32 \
  --region us-east-1 2>/dev/null || echo "Port 6443 rule already exists"

echo "Done! kubectl should work now."

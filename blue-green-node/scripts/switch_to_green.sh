#!/bin/bash
set -e

GREEN_TG="arn:aws:elasticloadbalancing:region:acct:targetgroup/TG-Green/xxx"
LISTENER="arn:aws:elasticloadbalancing:region:acct:listener/app/ALB/yyy"

aws elbv2 modify-listener \
  --listener-arn $LISTENER \
  --default-actions Type=forward,TargetGroupArn=$GREEN_TG

echo "Traffic switched → GREEN!"


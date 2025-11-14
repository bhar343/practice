#!/bin/bash
set -e

BLUE_TG="arn:aws:elasticloadbalancing:region:acct:targetgroup/TG-Blue/xxx"
LISTENER="arn:aws:elasticloadbalancing:region:acct:listener/app/ALB/yyy"

aws elbv2 modify-listener \
  --listener-arn $LISTENER \
  --default-actions Type=forward,TargetGroupArn=$BLUE_TG

echo "Rollback complete → BLUE live again!"


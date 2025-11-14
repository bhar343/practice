#!/bin/bash
set -e

GREEN_HOSTS=("green-ec2-1.amazonaws.com" "green-ec2-2.amazonaws.com")
APP_DIR="/var/www/nodeapp"

echo "Deploying to GREEN environment..."

for host in "${GREEN_HOSTS[@]}"; do
  echo "Deploying to $host ..."
  ssh -o StrictHostKeyChecking=no ec2-user@$host "
    sudo systemctl stop nodeapp || true
    sudo rm -rf ${APP_DIR}
    sudo mkdir -p ${APP_DIR}
  "

  scp -o StrictHostKeyChecking=no -r ./app/* ec2-user@$host:${APP_DIR}/

  ssh ec2-user@$host "
    cd ${APP_DIR}
    npm install
    sudo cp nodeapp.service /etc/systemd/system/nodeapp.service
    sudo systemctl daemon-reload
    sudo systemctl start nodeapp
    sudo systemctl enable nodeapp
  "
done

echo "GREEN environment deployed successfully!"


#!/bin/bash/env
systemctl start nginx.service
if [ $? == 0 ]
then
echo "enabled successfully"
else
echo "not enable successfully"
fi
systemctl enable nginx.service
if [ $? == 0 ]
then
echo "enabled successfully"
else
echo "not enable successfully"
fi
systemctl is-enabled nginx.service
if [ $? == 0 ]
then
echo "enabled successfully"
else
echo "not enable successfully"
fi
systemctl status nginx.service
if [ $? == 0 ]
then
echo "enabled successfully"
else
echo "not enable successfully"
fi


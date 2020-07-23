#!/bin/bash
source /etc/profile
if [ ${target_server} == "appia-sso-test" ];then
	sh ~/devops/jenkins_deploy_park.sh "172.16.1.69" "bitsso"
elif [ ${target_server} == "sso-dev" ];then
	sh ~/devops/jenkins_deploy_park.sh "10.30.60.164" "bitsso"
elif [ ${target_server} == "ssoin-dev" ];then
	sh ~/devops/jenkins_deploy_park.sh "192.168.16.177" "bitssoin"
elif [ ${target_server} == "sso-test" ];then
	sh ~/devops/jenkins_deploy_park.sh "10.30.60.116" "bitssoin"
else
    echo "target server not found"
fi

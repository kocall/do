#!/bin/bash
#-------------------------
#部署项目
#-------------------------
set -e

#当前构建任务的工作空间
job_workspace=`pwd`

echo "job_workspace is ${job_workspace}"

#当前脚本文件所在目录
cd `dirname $0`
current_dir=`pwd`
echo "current dir is: ${current_dir}"

target_server=$1
project_name=$2

#导入数据映射定义
source ./jenkins-data-map-definition.sh

project_data_string=${project_data_map["${project_name}"]}

#发布的程序包
release_package_path="${job_workspace}/${project_data_string}"

#跨服务器复制
echo "Upload ${release_package_path} to ${target_server} ..."
scp ${release_package_path} root@${target_server}:/root/upload/

echo "Upload ${release_package_path} to ${target_server} ok"
#!/bin/bash
ssh root@${target_server}   << eeooff
sh /root/deploy/deploy.sh ${project_name}

exit
eeooff
echo done!
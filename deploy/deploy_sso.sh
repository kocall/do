source /etc/profile
project_name=$1
project_home=$SSO_HOME
current_time=$(date +%y%m%d%H%M)
upload_home=/home/appuser/upload
if [[ ! -d  ${project_home}/../backup ]]; then
        mkdir ${project_home}/../backup
fi
if [[ -f  ${project_home}/${project_name}.war ]]; then
        cp ${project_home}/${project_name}.war ${project_home}/../backup/${project_name}_${current_time}.war
fi
echo "cp ${project_name} to ${project_home}"

cp ${upload_home}/${project_name}.war ${project_home}/${project_name}.war

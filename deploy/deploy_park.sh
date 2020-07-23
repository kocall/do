project_name=$1
source /etc/profile
project_home="/usr/local/bitmain/${project_name}"
current_time=$(date +%y%m%d%H%M)
upload_home=/home/appuser/upload
if [[ ! -d  ${project_home} ]]; then
        mkdir -p $project_home
fi
if [[ ! -d  ${project_home}/backup ]]; then
        mkdir ${project_home}/backup
fi
if [[ -f  ${project_home}/${project_name}.jar ]]; then
        mv ${project_home}/${project_name}_* ${project_home}/backup/
fi
pid=$(jps -l| grep  ${project_name} | cut -d " " -f 1)
echo ${pid}
if [[ ${pid} != "" ]]; then
        echo "kill ${project_name}"
        kill ${pid}
        until [[ $(jps -l| grep  ${project_name} | cut -d " " -f 1) == "" ]]; do
        echo "wating..."
        sleep 1
        done
        pid=""
fi
if [[ ${pid} == "" ]]; then
      echo "start ...."
     cp ${upload_home}/${project_name}.jar ${project_home}/${project_name}_${current_time}.jar
     java -jar  ${project_home}/${project_name}_${current_time}.jar --spring.profiles.active=prod> /dev/null &
     pid=$(jps -l| grep  ${project_name} | cut -d " " -f 1)
     echo "start ok ${pid} "
fi
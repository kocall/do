upload_dir="/root/upload"
deploy_dir="/root/deploy"
if [[ ! -d  ${upload_dir} ]]; then
		echo "mkidr ${upload_dir}"
        mkdir -p ${upload_dir}
fi
if [[ ! -d  ${deploy_dir} ]]; then
		echo "mkidr ${deploy_dir}"
        mkdir -p ${deploy_dir}
fi
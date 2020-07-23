prepare(){
echo "prepare ${target}"
scp ./prepare.sh root@${target}:/root/prepare.sh
ssh root@${target}  << eeooff
sh /root/prepare.sh
exit
eeooff
}

auth_key(){
key="ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQDa0gdZxRXuEoSLmgv0cH5nsjICEhreBm98rf+9p/A/TfZ+tGQc+1Y/qhxonriLQexwmXn3eusn/wInF9PS/i9/IiJQEe4NPvSpDWTuBWPB+DPSXwsraeRUOusHqarvpkokaiTOAgusoTazTIbzuskJy3rZ7d/bDQgCfeQNWVOGXn2ddOTHRkcwJuZTB1ECm7jsQsA5Wf8fSlsBJW1fSm80EQU3he6unWwfEbuSyFssPUGCQ4YOEP/cwhYAOJrC2Jv1L6uOAzOjxoggH+awZYmQocCW8IEsCS3dbfuEsoSdPYtdrA+PMKbZ2Iw9c3d5DHGkKqLJaISwgMXh2/Cu4/gR appuser@appia-oa-dev-app1";
ssh root@${target}  << eeooff
echo ${key} >> /root/.ssh/authorized_keys
exit
eeooff
}

boot_server(){
server_list=("sso-02" "sso-03" "sso-04" "sso-05")
for target in ${server_list[*]}; do
echo  "handle ${target}"
prepare
scp ./deploy.sh root@${target}:/root/deploy/deploy.sh	
auth_key
done
}

sso_server(){
sso_servers=("sso-02" "sso-03" "sso-04" "sso-05")
for target in ${sso_servers[*]}; do
echo  "handle ${target}"
#prepare
scp ./deploy_sso.sh root@${target}:/root/deploy/deploy_sso.sh	
auth_key
done	
}
boot_server
sso_server


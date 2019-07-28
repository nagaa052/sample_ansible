
cd `dirname ${0:h}`
current_path=../

function usage {
    cat <<EOF
$(basename ${0}) is a tool for ...
Usage:
    $(basename ${0}) [command] name
Commands:
    install         install base package
    setting         setting fabric network
    start           start fabric network
Options:
    --help, -h     print this
EOF
}

function install {
    cd ${current_path}
    #ansible-playbook --check -i inventories/local_hosts.yml ymls/local_install.yml --flush-cache -vvv
    ansible-playbook -i inventories/hosts.yml install.yml --flush-cache -vvv
}

function setting {
    cd ${current_path}
    ansible-playbook -i inventories/hosts.yml setting.yml --flush-cache -vvv
}

function start {
    cd ${current_path}
    ansible-playbook -i inventories/hosts.yml start.yml --flush-cache -vvv
}




case ${1} in
    "install" )
        install
    ;;
    "setting" )
        setting
    ;;
    "start" )
        start
    ;;
    "--help")
        usage
    ;;
    *)
        echo "[ERROR] Invalid argument. See the --help command."
    ;;
esac

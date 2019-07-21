
cd `dirname ${0:h}`
current_path=../

function usage {
    cat <<EOF
$(basename ${0}) is a tool for ...
Usage:
    $(basename ${0}) [command] name
Commands:
    install         install base package
Options:
    --help, -h     print this
EOF
}

function local {
    cd ${current_path}
    #ansible-playbook --check -i inventories/hosts ymls/local.yml --flush-cache -vvv
    ansible-playbook playbooks/local_test.yaml
}



case ${1} in
    "local" )
        local
    ;;
    "--help")
        usage
    ;;
    *)
        echo "[ERROR] Invalid argument. See the --help command."
    ;;
esac

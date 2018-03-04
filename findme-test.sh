send_location() {
    read -p 'Enter password: ' -s password && echo
    curl -d "{\"lat\": $2, \"lng\": $3}" -H "Content-Type: application/json" -s -u $1:$password -X POST $4
}

show_usage() {
    echo 'Usage: findme-test [-u|--username] latitude longitude url'
    exit $1
}

if [ $# -eq 0 ]; then
    show_usage 1
elif [ "$1" == "-h" ] || [ "$1" == "--help" ]; then
    show_usage 0
elif [ "$1" == "-u" ] || [ "$1" == "--username" ]; then
    if [ $# -lt 5 ]; then
        show_usage 1
    else
        send_location ${@:2}
    fi
else
    if [ $# -lt 3 ]; then
        show_usage 1
    else
        read -p 'Enter username: ' username
        send_location $username $@
    fi
fi

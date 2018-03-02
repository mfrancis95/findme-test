show_usage() {
    echo 'Usage: findme-test url latitude longitude'
    exit $1
}

if [ $# -eq 0 ]; then
    show_usage 1
elif [ "$1" == "-h" ] || [ "$1" == "--help" ]; then
    show_usage 0
elif [ $# -lt 3 ]; then
    show_usage 1
else
    read -p 'Enter username: ' username
    read -p 'Enter password: ' -s password && echo
    curl -d "{\"lat\": $2, \"lng\": $3}" -H "Content-Type: application/json" -s -u $username:$password -X POST $1
fi

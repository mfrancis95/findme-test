show_usage() {
    echo 'Usage: findme-test url latitude longitude'
}

if [ "$1" == "-h" ] || [ "$1" == "--help" ]; then
    show_usage
elif [ $# -lt 3 ]; then
    show_usage
    exit 1
else
    read -p 'Enter username: ' username
    read -p 'Enter password: ' -s password && echo
    curl -d "{\"lat\": $2, \"lng\": $3}" -H "Content-Type: application/json" -s -u $username:$password -X POST $1
fi

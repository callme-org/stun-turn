token="$1"

service_url="http://callme-auth:8080/open/auth/autheticate"

response=$(curl -s -o /dev/null -w "%{http_code}" -X POST -H "Authorization: Bearer $token" "$service_url")

if [ "$response" == "200" ]; then
    exit 0
else
    exit 1
fi

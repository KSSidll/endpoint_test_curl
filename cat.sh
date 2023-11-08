api_key=your_api_here

echo "Getting you a random cat..."
curl \
https://api.thecatapi.com/v1/images/search \
-X GET \
-H "x-api-key: $api_key"

echo ""
echo ""
echo "Maybe a random cat isn't enough for you, have a special one then"
curl \
https://api.thecatapi.com/v1/images/aiv \
-X GET \
-H "x-api-key: $api_key"

echo ""
echo ""
echo "You really liked that cat huh, posting it as favourite"
favourite_result="$(
curl -s \
https://api.thecatapi.com/v1/favourites \
-X POST \
-H "x-api-key: $api_key" \
-H "Content-Type: application/json" \
--data '{ "image_id": "aiv" }'
)"
echo "$favourite_result"

echo ""
echo ""
echo "And yet love is fleeting, deleting"
# split with :,} delimiters and search for `id`
favourite_id=$(echo "$favourite_result" | awk -F'[:,}]' '{for(i=1;i<=NF;i++) if($i ~ /"id"/) print $(i+1)}')
curl \
https://api.thecatapi.com/v1/favourites/$favourite_id \
-X DELETE \
-H "x-api-key: $api_key" 


echo ""
echo ""
echo "And yet, we can't stop putting our hopes in it"
vote_result="$(
curl -s \
https://api.thecatapi.com/v1/votes \
-X POST \
-H "x-api-key: $api_key" \
-H "Content-Type: application/json" \
--data '{ "image_id": "aiv", "value": 1 }'
)"
echo "$vote_result"

echo ""
echo ""
echo "But in the end... everything is bound to submit to the void and get deleted from the universe"
# split with :,} delimiters and search for `id`
vote_id=$(echo "$vote_result" | awk -F'[:,}]' '{for(i=1;i<=NF;i++) if($i ~ /"id"/) print $(i+1)}')
curl \
https://api.thecatapi.com/v1/votes/$vote_id \
-X DELETE \
-H "x-api-key: $api_key" 

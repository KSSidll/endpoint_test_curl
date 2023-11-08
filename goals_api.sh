#!/bin/sh

curl -s \
-X GET \
http://127.0.0.1:8000/goals
echo ""
echo ""

curl -s \
-X GET \
http://127.0.0.1:8000/users/Bob/goals
echo ""
echo ""

curl -s \
-X POST \
http://127.0.0.1:8000/goals \
-H "Content-Type: application/json" \
--data '{ 
"id": 4, 
"title": "a goal", 
"due_date": "01.02.2028", 
"frequency": 2, 
"progress": -3.4, 
"archived": false 
}'
echo ""
echo ""

curl -s \
-X PUT \
http://127.0.0.1:8000/goals/4 \
-H "Content-Type: application/json" \
--data '{ 
"id": 7, 
"title": "a second goal", 
"due_date": "01.02.2030", 
"frequency": 2, 
"progress": -3.4, 
"archived": false 
}'
echo ""
echo ""

curl -s \
-X DELETE \
http://127.0.0.1:8000/goals/2

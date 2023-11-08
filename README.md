This repository was created as part of university curriculum

In this repository, we test http requests using `curl`

The [main target](cat.sh) is [the cat api](https://thecatapi.com/)  
It was chosen because of how easy it is to get api key for it, and because i needed a way to appease our cat overlords

The point of the exercise was to hit `GET`, `POST`, `PUT` and `DELETE` endpoints, but the chosen API doesn't seem to accept PUT requests, and as such, it was decided to hit `GET` twice, `POST` twice and `DELETE` twice instead

In addition to that, there is a [secondary target](goals_api.sh) where we hit a local endpoint instead

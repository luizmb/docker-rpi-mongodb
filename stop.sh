docker exec mongodb_container kill $(docker exec mongodb_container pidof mongod)

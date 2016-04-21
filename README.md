# Mongo Service [![Circle CI](https://circleci.com/gh/Originate/exosphere-mongodb-service.svg?style=shield&circle-token=389739b88cceec7155d0253e1560339a8409fd98)](https://circleci.com/gh/Originate/exosphere-mongodb-service)
> An Exosphere service for storing entry data


## Installation

* install MongoDB

  ```
  brew install mongodb
  ```

* install dependencies

  ```
  npm install
  ```


## running

* start MongoDB

  ```
  mongod --config /usr/local/etc/mongod.conf
  ```

* start the service

  ```
  env EXOCOMM_PORT=4000 EXORELAY_PORT=4001 bin/start
  ```


## Development

See your [developer documentation](CONTRIBUTING.md)

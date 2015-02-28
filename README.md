# Hapi Router Coffee
[![Build Status](https://travis-ci.org/ethanmick/hapi-router-coffee.svg?branch=master)](https://travis-ci.org/ethanmick/hapi-router-coffee.svg?branch=master) [![Coverage Status](https://coveralls.io/repos/ethanmick/hapi-router-coffee/badge.svg?branch=master)](https://coveralls.io/r/ethanmick/hapi-router-coffee?branch=master)

An Opinionated Route Loader for [Hapi](https://github.com/hapijs/hapi) for CoffeeScript files.

This fork does two things, which may interest you:
1. Written in CoffeeScript (and **not** compiled to JS), so it can autoload .coffee files.
2. Allows you to pass options to the routes, and merge in the options already on the route.

## Setup

```bash
$ npm install hapi-router-coffee --save
```

I assume you're writing in CoffeeScript, right?
```coffee
server.register {
  register: require('hapi-router-coffee')
  options:
    routesDir: __dirname + '/routes/'
}, (err)->
  throw err if err
}
```

## Options

The following required `options` should be provided at registration:
* `routesDir`: the path to your routes directory

## Specifying Routes
Any `.js` or `.coffee` files in your routes directory will be loaded - supports nested routes.

Example route file:
```js
module.exports = [
  {
    path: '/test1',
    method: 'GET',
    handler: function (request, reply) {
      reply('hello');
    }
  },
  {
    path: '/test2',
    method: 'GET',
    handler: function (request, reply) {
      reply('hello');
    }
  }
]
```

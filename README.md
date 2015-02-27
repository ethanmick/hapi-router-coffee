#hapi-router
[![Build Status](https://travis-ci.org/enjoy/hapi-router.svg?branch=master)](https://travis-ci.org/enjoy/hapi-router) [![Code Climate](https://codeclimate.com/github/enjoy/hapi-router/badges/gpa.svg)](https://codeclimate.com/github/enjoy/hapi-router) [![Test Coverage](https://codeclimate.com/github/enjoy/hapi-router/badges/coverage.svg)](https://codeclimate.com/github/enjoy/hapi-router) [![Version](https://badge.fury.io/js/hapi-router.svg)](http://badge.fury.io/js/hapi-router) [![Downloads](http://img.shields.io/npm/dm/hapi-router.svg)](https://www.npmjs.com/package/hapi-router)

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
  register: require('hapi-router')
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

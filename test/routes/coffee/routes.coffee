'use strict'

module.exports = [
  path: '/test/coffee'
  method: 'GET'
  handler: (request, reply)->
    reply(hello: 'world')
]

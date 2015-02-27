'use strict'

chai = require 'chai'
expect = chai.expect
chai.use(require('chai-as-promised'))

Hapi = require 'hapi'

describe 'hapi-router', ->
  server = null

  beforeEach ->
    server = new Hapi.Server()
    server.connection()


  register = (options)->
    server.register {
      register: require('../')
      options: options
    }, (err)->
      throw err if err

  it 'can load routes', ->
    register routesDir: __dirname + '/routes/'
    expect(server.connections[0].table()).to.have.length(3)

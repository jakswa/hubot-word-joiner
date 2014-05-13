chai = require 'chai'
sinon = require 'sinon'
chai.use require 'sinon-chai'

expect = chai.expect

describe 'hello-world', ->
  beforeEach ->
    @robot =
      respond: sinon.spy()
      hear: sinon.spy()

    require('../src/word-joiner')(@robot)

  it 'registers a hear listener', ->
    expect(@robot.hear).to.have.been.calledWith sinon.match( (val) ->
      val.test 'woo oops'
    )

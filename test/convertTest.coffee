chai = require 'chai'
chai.should()
expect = chai.expect
convert = require '../src/convert'

describe 'CONVERT', ->
	it 'gram to oz to gram', ->
		a = 500

		convert['oz']['grams'](convert['grams']['oz'](a)).should.equal(a)
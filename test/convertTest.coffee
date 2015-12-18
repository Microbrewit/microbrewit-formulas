chai = require 'chai'
chai.should()
expect = chai.expect
convert = require '../src/convert'
Decimal = require 'decimal.js'

describe 'CONVERT', ->
	a = 500
	y = 20.20123
	it 'gram to oz to gram', ->
		convert['grams']['oz'](a).should.be.a('number')
		convert['grams']['oz'](null).should.equal(0)
		convert['oz']['grams'](convert['grams']['oz'](a)).should.equal(a)
		convert['oz']['grams'](convert['grams']['oz'](y)).should.equal(y)
	
	it 'grams to kg to grams', ->	
		convert['grams']['kg'](a).should.be.a('number')	
		convert['grams']['kg'](null).should.equal(0)	
		convert['kg']['grams'](convert['grams']['kg'](a)).should.equal(a)
		convert['kg']['grams'](convert['grams']['kg'](y)).should.equal(y)
	
	it 'grams to lbs to grams', ->		
		convert['grams']['lbs'](a).should.be.a('number')
		convert['grams']['lbs'](null).should.equal(0)
		convert['lbs']['grams'](convert['grams']['lbs'](a)).should.equal(a)
		convert['lbs']['grams'](convert['grams']['lbs'](y)).should.equal(y)
		
	#kg
	it 'kg to grams to kg', ->
		convert['kg']['grams'](a).should.be.a('number')
		convert['kg']['grams'](null).should.equal(0)
		convert['grams']['kg'](convert['kg']['grams'](a)).should.equal(a)	
		convert['grams']['kg'](convert['kg']['grams'](y)).should.equal(y)
		
	it 'kg to lbs to kg', ->
		convert['kg']['lbs'](a).should.be.a('number')
		convert['kg']['lbs'](null).should.equal(0)
		convert['lbs']['kg'](convert['kg']['lbs'](a)).should.equal(a)	
		convert['lbs']['kg'](convert['kg']['lbs'](y)).should.equal(y)
	
	it 'kg to oz to kg', ->
		convert['kg']['oz'](a).should.be.a('number')
		convert['kg']['oz'](null).should.equal(0)
		convert['oz']['kg'](convert['kg']['oz'](a)).should.equal(a)	
		convert['oz']['kg'](convert['kg']['oz'](y)).should.equal(y)
	
	it 'oz to grams to oz', ->
		convert['oz']['grams'](a).should.be.a('number')
		convert['oz']['grams'](null).should.equal(0)
		convert['grams']['oz'](convert['oz']['grams'](a)).should.equal(a)
		convert['grams']['oz'](convert['oz']['grams'](y)).should.equal(y)
	
	it 'oz to lbs to oz', ->
		convert['oz']['lbs'](a).should.be.a('number')
		convert['oz']['lbs'](null).should.equal(0)
		convert['lbs']['oz'](convert['oz']['lbs'](a)).should.equal(a)
		convert['lbs']['oz'](convert['oz']['lbs'](y)).should.equal(y)
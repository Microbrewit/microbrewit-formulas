chai = require 'chai'
chai.should()
expect = chai.expect
convert = require '../src/convert'

describe 'CONVERT', ->
	it 'gram to oz to gram', ->
		a = 500
		convert['oz']['grams'](convert['grams']['oz'](a)).should.equal(a)
	it 'grams to kg to grams', ->
		a = 500
		convert['kg']['grams'](convert['grams']['kg'](a)).should.equal(a)
	it 'grams to lbs to grams', ->
		a = 500
		convert['lbs']['grams'](convert['grams']['lbs'](a)).should.equal(a)	
	#kg
	it 'kg to grams to kg', ->
		a = 1.5
		convert['grams']['kg'](convert['kg']['grams'](a)).should.equal(a)
	
	
	
	
	
	it 'oz to grams to oz', ->
		a = 50.55 
		b = 100
		convert['grams']['oz'](convert['oz']['grams'](a)).should.equal(a)
		convert['grams']['oz'](convert['oz']['grams'](b)).should.equal(b)
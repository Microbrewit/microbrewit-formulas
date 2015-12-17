chai = require 'chai'
chai.should()
expect = chai.expect
convert = require '../src/convert'

describe 'CONVERT', ->
	a = 500.00000
	y = 20.20
	it 'gram to oz to gram', ->
		#convert['grams']['oz'](a).should.equal(500)
		convert['oz']['grams'](convert['grams']['oz'](a)).should.equal(a)
		convert['oz']['grams'](convert['grams']['oz'](y)).should.equal(y)
	
	it 'grams to kg to grams', ->		
		convert['kg']['grams'](convert['grams']['kg'](a)).should.equal(a)
	
	it 'grams to lbs to grams', ->		
		convert['lbs']['grams'](convert['grams']['lbs'](a)).should.equal(a)	
	#kg
	it 'kg to grams to kg', ->
		convert['grams']['kg'](convert['kg']['grams'](a)).should.equal(a)	
	
	it 'oz to grams to oz', ->
		convert['grams']['oz'](convert['oz']['grams'](a)).should.equal(a)
		convert['grams']['oz'](convert['oz']['grams'](y)).should.equal(y)
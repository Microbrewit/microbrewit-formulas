chai = require 'chai'
chai.should()
expect = chai.expect
colour = require '../src/colour'

describe 'COLOUR', ->
	it 'All formulas available', ->
		for formula in colour.available
			abv[formula].should.be.a('function')
	
	it 'Morey', ->
		calcObj = 
			'weight':10 
			'lovibond':30
			'postBoilVolume':20
		colour['morey'](calcObj).should.be.a('number')
		
			
	
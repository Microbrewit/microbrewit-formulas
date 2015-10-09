chai = require 'chai'
chai.should()
expect = chai.expect
abv = require '../src/abv'

describe 'ABV', ->
	it 'All formulas available', ->
		for formula in abv.available
			abv[formula].should.be.a('function')
			
	it 'Miller', ->
		abv['miller'](1.040,1.010).should.be.a('number')
		abv['miller'](null, null).should.equal(0)

	it 'Simple', ->
		abv['simple'](1.040,1.010).should.be.a('number')
		abv['simple'](null, null).should.equal(0)

	it 'Alternative Simple', ->
		abv['alternativeSimple'](1.040,1.010).should.be.a('number')
		abv['alternativeSimple'](null, null).should.equal(0)

	it 'Advanced', ->
		abv['advanced'](1.040,1.010).should.be.a('number')
		abv['advanced'](null, null).should.equal(0)

	it 'Alternative Advanced', ->
		abv['alternativeAdvanced'](1.040,1.010).should.be.a('number')
		abv['alternativeAdvanced'](null, null).should.equal(0)


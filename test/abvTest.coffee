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
		abv['miller'](1.040,1.010).should.equal(4.00)
		abv['miller'](1.062,1.015).should.equal(6.266666666666667)

	it 'Simple', ->
		abv['simple'](1.040,1.010).should.be.a('number')
		abv['simple'](null, null).should.equal(0)
		abv['simple'](1.040,1.010).should.equal(3.9375)
		abv['simple'](1.062,1.015).should.equal(6.16875)

	it 'Alternative Simple', ->
		abv['alternativeSimple'](1.040,1.010).should.be.a('number')
		abv['alternativeSimple'](null, null).should.equal(0)
		abv['alternativeSimple'](1.040,1.010).should.equal(3.95)
		abv['alternativeSimple'](1.062,1.015).should.equal(6.15)

	it 'Advanced', ->
		abv['advanced'](1.040,1.010).should.be.a('number')
		abv['advanced'](null, null).should.equal(0)
		abv['advanced'](1.040,1.010).should.equal(3.86)
		abv['advanced'](1.062,1.015).should.equal(6.13)

	it 'Alternative Advanced', ->
		abv['alternativeAdvanced'](1.040,1.010).should.be.a('number')
		abv['alternativeAdvanced'](null, null).should.equal(0)
		abv['alternativeAdvanced'](1.040,1.010).should.equal(3.95)
		abv['alternativeAdvanced'](1.062,1.015).should.equal(6.41)


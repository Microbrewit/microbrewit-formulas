chai = require 'chai'
chai.should()
expect = chai.expect
convert = require '../src/convert'
Decimal = require 'decimal.js'

describe 'CONVERT', ->
	a = 500
	b = 20.20123
	
	#From grams to n convertion
	it 'grams to oz', ->
		convert['grams']['oz'](a).should.be.a('number')
		convert['grams']['oz'](null).should.equal(0)
		convert['grams']['oz'](a).should.be.equal(17.636980975)
		
	it 'gram to oz to gram', ->
		convert['oz']['grams'](convert['grams']['oz'](a)).should.equal(a)
		convert['oz']['grams'](convert['grams']['oz'](b)).should.equal(b)
	
	it 'grams to kg', ->
		convert['grams']['kg'](a).should.be.a('number')	
		convert['grams']['kg'](null).should.equal(0)
		convert['grams']['kg'](a).should.equal(0.5)	
		
	it 'grams to kg to grams', ->	
		convert['kg']['grams'](convert['grams']['kg'](a)).should.equal(a)
		convert['kg']['grams'](convert['grams']['kg'](b)).should.equal(b)
	
	it 'grams to lbs', ->
		convert['grams']['lbs'](a).should.be.a('number')
		convert['grams']['lbs'](null).should.equal(0)
		convert['grams']['lbs'](a).should.be.equal(1.102311311)
	
	it 'grams to lbs to grams', ->		
		convert['lbs']['grams'](convert['grams']['lbs'](a)).should.equal(a)
		convert['lbs']['grams'](convert['grams']['lbs'](b)).should.equal(b)
		
	#From kg to n convertion
	it 'kg to grams', ->
		convert['kg']['grams'](a).should.be.a('number')
		convert['kg']['grams'](null).should.equal(0)
		convert['kg']['grams'](a).should.equal(500000)
		
	it 'kg to grams to kg', ->
		convert['grams']['kg'](convert['kg']['grams'](a)).should.equal(a)	
		convert['grams']['kg'](convert['kg']['grams'](b)).should.equal(b)
		
	it 'kg to lbs', ->
		convert['kg']['lbs'](a).should.be.a('number')
		convert['kg']['lbs'](null).should.equal(0)
		convert['kg']['lbs'](a).should.equal(1102.311311)
			
	it 'kg to lbs to kg', ->
		convert['lbs']['kg'](convert['kg']['lbs'](a)).should.equal(a)	
		convert['lbs']['kg'](convert['kg']['lbs'](b)).should.equal(b)
	
	it 'kg to oz', ->
		convert['kg']['oz'](a).should.be.a('number')
		convert['kg']['oz'](null).should.equal(0)
		convert['kg']['oz'](a).should.equal(17636.980975)
		
	it 'kg to oz to kg', ->
		convert['oz']['kg'](convert['kg']['oz'](a)).should.equal(a)	
		convert['oz']['kg'](convert['kg']['oz'](b)).should.equal(b)
	
	#From oz to n convertion
	it 'oz to grams', ->
		convert['oz']['grams'](a).should.be.a('number')
		convert['oz']['grams'](null).should.equal(0)
		convert['oz']['grams'](a).should.equal(14174.76156233139)
		
	it 'oz to grams to oz', ->
		convert['grams']['oz'](convert['oz']['grams'](a)).should.equal(a)
		convert['grams']['oz'](convert['oz']['grams'](b)).should.equal(b)
	
	it 'oz to lbs', ->
		convert['oz']['lbs'](a).should.be.a('number')
		convert['oz']['lbs'](null).should.equal(0)
		convert['oz']['lbs'](a).should.equal(31.25)
		
	it 'oz to lbs to oz', ->
		convert['lbs']['oz'](convert['oz']['lbs'](a)).should.equal(a)
		convert['lbs']['oz'](convert['oz']['lbs'](b)).should.equal(b)
	
	it 'oz to kg', -> 
		convert['oz']['kg'](a).should.be.a('number')
		convert['oz']['kg'](null).should.equal(0)
		convert['oz']['kg'](a).should.equal(14.17476156233139)
		
	it 'oz to kg to oz', ->
		convert['kg']['oz'](convert['oz']['kg'](a)).should.equal(a)
		convert['kg']['oz'](convert['oz']['kg'](b)).should.equal(b)
	
	#From lbs to n convertion
	it 'lbs to grams', ->
		convert['lbs']['grams'](a).should.be.a('number')
		convert['lbs']['grams'](null).should.equal(0)
		convert['lbs']['grams'](a).should.equal(226796.1849844431)
		
	it 'lbs to grams to lbs', ->
		convert['grams']['lbs'](convert['lbs']['grams'](a)).should.equal(a)
		convert['grams']['lbs'](convert['lbs']['grams'](b)).should.equal(b)
	
	it 'lbs to oz', ->
		convert['lbs']['oz'](a).should.be.a('number')
		convert['lbs']['oz'](null).should.equal(0)
		convert['lbs']['oz'](a).should.equal(8000)
		
	it 'lbs to oz to lbs', ->
		convert['oz']['lbs'](convert['lbs']['oz'](a)).should.equal(a)
		convert['oz']['lbs'](convert['lbs']['oz'](b)).should.equal(b)
	
	it 'lbs to kg', ->
		convert['lbs']['kg'](a).should.be.a('number')
		convert['lbs']['kg'](null).should.equal(0)
		convert['lbs']['kg'](a).should.equal(226.7961849844431)
		
	it 'lbs to kg to lbs', ->
		convert['kg']['lbs'](convert['lbs']['kg'](a)).should.equal(a)
		convert['kg']['lbs'](convert['lbs']['kg'](b)).should.equal(b)
	
	#Sg to plato convertion
	it 'sg to plato', ->
		convert['sg']['plato'](1.040).should.be.a('number')
		convert['sg']['plato'](null).should.equal(0)
		convert['sg']['plato'](1.040).should.equal(9.99)
	
	it 'sg to plato to sg', -> 
		convert['plato']['sg'](convert['sg']['plato'](1.04)).should.equal(1.04)
		convert['plato']['sg'](convert['sg']['plato'](1.062)).should.equal(1.062)
	
	it 'plato to sg', ->
		convert['plato']['sg'](10).should.be.a('number')
		convert['plato']['sg'](null).should.equal(0)
		convert['plato']['sg'](10).should.equal(1.04)
	
	it 'plato to sg to plato', ->
		convert['sg']['plato'](convert['plato']['sg'](9.99)).should.equal(9.99)
		convert['sg']['plato'](convert['plato']['sg'](16.5)).should.equal(16.5)
		
	#Celcius to n
	it 'celcius to farenheit', ->
		convert['celcius']['farenheit'](68).should.be.a('number')
		convert['celcius']['farenheit'](null).should.equal(0)
		convert['celcius']['farenheit'](68).should.equal(154.4)
		convert['celcius']['farenheit'](33.3).should.equal(91.94)
	
	it 'celcius to kelvin', ->
		convert['celcius']['kelvin'](68).should.be.a('number')
		convert['celcius']['kelvin'](null).should.equal(0)
		convert['celcius']['kelvin'](68).should.equal(341.15)
		convert['celcius']['kelvin'](33.3).should.equal(306.45)
	
	#Farenheit to n
	it 'farenheit to celcius', ->
		convert['farenheit']['celcius'](154.4).should.be.a('number')
		convert['farenheit']['celcius'](null).should.equal(0)
		convert['farenheit']['celcius'](154.4).should.equal(68)
		convert['farenheit']['celcius'](91.94).should.equal(33.3)
	
	it 'farenheit to kelvin', ->
		convert['farenheit']['kelvin'](154.4).should.be.a('number')
		convert['farenheit']['kelvin'](null).should.equal(0)
		convert['farenheit']['kelvin'](154.4).should.equal(341.15)
		convert['farenheit']['kelvin'](91.94).should.equal(306.45)
		
	#Kelvin to n
	it 'kelvin to celcius', ->
		convert['kelvin']['celcius'](341.15).should.be.a('number')
		convert['kelvin']['celcius'](null).should.equal(0)
		convert['kelvin']['celcius'](341.15).should.equal(68)
		convert['kelvin']['celcius'](306.45).should.equal(33.3)
		
	it 'kelvin to farenheit', ->
		convert['kelvin']['farenheit'](341.15).should.be.a('number')
		convert['kelvin']['farenheit'](null).should.equal(0)
		convert['kelvin']['farenheit'](341.15).should.equal(154.4)
		convert['kelvin']['farenheit'](306.45).should.equal(91.94)
		
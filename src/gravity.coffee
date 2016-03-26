convert = require './convert'
_ = 
	isNaN: require 'lodash.isnan'
Decimal = require 'decimal.js'
Decimal.config({'errors':false})

# @param [Integer] totalGP The sum of gravity points for the recipe
# @return [Float] OG
og = (totalGP) ->
	og = (1 + totalGP / 1000)
	og = 1 if _.isNaN(og)
	return og.toFixed(3)

# @param [Float] OG
# @param [Float] attenuation (default: 0.75) The attenuation of the yeast as a float number.
# @return [Float] FG
fg = (og, attenuation = 0.75) ->
	fg = (og - 1) * (1 - attenuation) + 1
	fg = og if _.isNaN(fg)
	return fg.toFixed(3)

# @param [Integer] og Original Gravity of recipe
# @param [Integer] gp Gravity points for ingredient
# @return [Float] percent
gravityPercentage = (og, gp) ->
	totalGP = (og - 1) * 1000

	if totalGP is 0
		percent = 0
	else
		percent = Math.round gp / totalGP * 100

	return percent

# @param [Object] calc
# @option calc [String] type Type of fermentable (malt, sugar, etc)
# @option calc [Integer] efficiency (default: 75) Efficiency of recipe as percentage
# @option calc [Float] amount The amount of the ingredient in grams (unit can be overwritten with weightUnit)
# @option calc [Float] volume The amount of liquid at boil end in liters (unit can be overwritten with fluidUnit)
# @option calc [Integer] ppg The ppg value for the ingredient
# @option calc [String] fluidUnit (optional, default is liters)
# @option calc [String] weightUnit (optional, default is grams)
# @return [Integer] Gravity Points
gravityPoints = (calc) ->
	calc.type = calc.type.toLowerCase()
	calc.weightUnit ?= 'grams'
	calc.fluidUnit ?= 'liters'
	calc.ppg = parseFloat(calc.ppg)

	# Convert point per gallon per gallon to 
	# points per kg per liter
	pKgL = calc.ppg * 0.11982643 / 8.3454045

	# Formula uses imperial measures
	calc.weight = convert.convert(parseFloat(calc.amount), calc.weightUnit, 'kg')
	calc.volume = convert.convert(parseFloat(calc.volume), calc.fluidUnit, 'liters')

	# We only take into account efficiency for malts and grains
	# Other types of fermenables (notably sugars and sirups) have 100% efficiency
	if calc.type is 'malt' or calc.type is 'grain'
		calc.efficiency = parseFloat(calc.efficiency)/100
	else
		calc.efficiency = 1

	console.log calc.weight + ' ' + pKgL + ' ' + calc.efficiency + ' ' + calc.volume
	
	gravityPoints = Math.round((calc.weight * pKgL * calc.efficiency) / calc.volume)

	return gravityPoints

module.exports = {gravityPoints, gravityPercentage, og, fg}
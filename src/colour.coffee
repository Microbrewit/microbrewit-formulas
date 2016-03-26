# Formulas to calculate SRM from an MCU value
# All formulas require metric
# Requires calcObjs which contains either an mcu or weight, lovibond and postBoilVolume
# @author Torstein Thune
# @copyright 2014 Microbrew.it

convert = require './convert'

module.exports =
	# @return [Array<String>] Available formulae
	available: ->
		available = Object.keys @

		available.splice(available.indexOf('available'), 1)

		return available

	# Calculate mcu
	# MCU takes metric values
	# @param [number/kg] weight
	# @param [number] lovibond
	# @param [number/liters]postBoilVolume
	# @return [number] MCU
	mcu: (weight, lovibond, postBoilVolume) ->
		weight = convert.convert(weight, 'kg', 'lbs')
		volume = convert.convert(postBoilVolume, 'liters', 'gallons')

		return (weight*lovibond / volume)

	# Morey
	# @return [float] srm
	morey: (calc) ->
		calc.mcu = @mcu(calc.weight, calc.lovibond, calc.postBoilVolume) unless calc.mcu?

		return 1.4922 * Math.pow(calc.mcu, 0.6859)
	
	# Daniels
	# @return [float] srm
	daniels: (calc) ->
		calc.mcu = @mcu(calc.weight, calc.lovibond, calc.postBoilVolume) unless calc.mcu?

		return (0.2 * calc.mcu) + 8.4

	# Mosher
	# @return [float] srm
	mosher: (calc) ->
		calc.mcu = @mcu(calc.weight, calc.lovibond, calc.postBoilVolume) unless calc.mcu?
		return (0.3 * calc.mcu) + 4.7

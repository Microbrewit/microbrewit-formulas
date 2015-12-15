# Formulas to calculate SRM from an MCU value
# All formulas require metric
# Requires calcObjs which contains either an mcu or weight, lovibond and postBoilVolume
# @author Torstein Thune
# @copyright 2014 Microbrew.it

convert = require './convert'

module.exports =
	# Return available formulas
	available: () ->
		return ['morey', 'daniels', 'mosher']

	# Calculate mcu
	# MCU takes metric values
	# @param [number/kg] weight
	# @param [number] lovibond
	# @param [number/liters]postBoilVolume
	# @return [number] MCU
	mcu: (weight, lovibond, postBoilVolume) ->
		weight = convert.convert(weight, 'kg', 'lbs')
		volume = convert.convert(postBoilVolume, 'liters', 'gallons')

		return (weight*lovibond/volume)

	# Morey
	# @return [float] srm
	morey: (calcObj) ->
		calcObj.mcu = @mcu(calcObj.weight, calcObj.lovibond, calcObj.postBoilVolume) unless calcObj.mcu?

		return 1.4922 * Math.pow(calcObj.mcu, 0.6859)
	
	# Daniels
	# @return [float] srm
	daniels: (calcObj) ->
		calcObj.mcu = @mcu(weight, lovibond, postBoilVolume) unless calcObj.mcu?

		return (0.2 * calcObj.mcu) + 8.4

	# Mosher
	# @return [float] srm
	mosher: (calcObj) ->
		calcObj.mcu = @mcu(weight, lovibond, postBoilVolume) unless calcObj.mcu?
		return (0.3 * calcObj.mcu) + 4.7

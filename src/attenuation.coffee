# Normalise an attenuation value
# We want attenuation: { low: int, high: int }
# @param [string/number] apparentAttenuationRange
# @return [object] { low: int, high: int }
module.exports = 
	normalise: (apparentAttenuationRange) ->

	# Already normalised
	if typeof apparentAttenuationRange.low is 'number' and typeof apparentAttenuationRange.high is 'number'
		return apparentAttenuationRange

	apparentAttenuationRange = '' + apparentAttenuationRange.replace(/%/g, '').trim().toLowerCase()

	switch apparentAttenuationRange
		when 'low'
		then apparentAttenuationRange = '60-70'
		
		when 'medium' 
		then apparentAttenuationRange = '70-80'
		
		when 'med-high (77-84)' 
		then apparentAttenuationRange = '77-84'
		
		when 'med-high' 
		then apparentAttenuationRange = '77-84'
		
		when 'high' 
		then apparentAttenuationRange = '80-90'
		
		when 'very high' 
		then apparentAttenuationRange = '88-95'

		when '85+'
		then apparentAttenuationRange = '85-90'

		when '80-85+'
		then apparentAttenuationRange = '80-85'

		when '-80'
		then apparentAttenuationRange = '75-80'

		when ''
		then apparentAttenuationRange = '70-80'

		when 'na'
		then apparentAttenuationRange = '70-80'

		when 'unknown'
		then apparentAttenuationRange = '70-80'

	if apparentAttenuationRange.indexOf('>') isnt -1
		apparentAttenuationRange = parseInt apparentAttenuationRange.replace('>', '')
		apparentAttenuationRange = "#{apparentAttenuationRange}-#{apparentAttenuationRange+5}"


	if apparentAttenuationRange.indexOf('-') < 0
		apparentAttenuationRange = "#{apparentAttenuationRange}-#{apparentAttenuationRange}"

	apparentAttenuationRange = apparentAttenuationRange.split('-')

	return {
		low: apparentAttenuationRange[0]
		high: apparentAttenuationRange[1]
	}
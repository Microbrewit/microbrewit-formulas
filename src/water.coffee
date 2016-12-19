
defaults =
	waterShrinkage: 4 # 4% shrinkage when cooling
	grainAbsobtion: 0.15 # Gallons per pound of Grain

	boiloffPercent: 10 # Percent boiloff per hour (default: 10%)
	equipmentLoss: 1 # Liters left in mash tun after chilling

	trubLoss: 1 # number of liters lost to trub

# Calculate water lost during boil
# @param [Integer] boiloffPercent Boiloff constant in percent
# @param [Integer] boilTime Boil time in minutes
# @param [Float] volume Amount of mash in liters
# @return [Float] Liters boiled off
boiloff = (boiloffPercent = boiloffPercent, boilTime, volume) ->
	boiloffConstant = boiloffPercent / 100
	boilTime = boilTime / 60

	return volume * boiloffConstant * boilTime

# @param [Object] conf
# @option conf [Integer] boiloffPercent (percent - default: 10%) The percentage liquid lost per hour of boil
# @option conf [Integer] boilTime (minutes) The length of the boil in minutes
# @option conf [Float] preBoilVolume (liters) The volume of the mash + sparge in liters
# @option conf [Float] equipmentLoss (liters - default: 1l) The amount of liquid left in equipment after boiling in liters
# @option conf [Float] waterShrinkage (percent - default 4%) Percentage shrinkage of water when cooled down
# @option conf [Float] trubLoss (liters - default: 0.5l) The amount of liquid lost to trub in liters 
boilLoss = (conf) ->

calculateSparge = () ->

mashLoss = (grainAbsobtion = grainAbsobtion, grainBill) ->


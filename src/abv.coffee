# @author Torstein Thune
# @copyright 2015 Microbrew.it

convert = require './convert'
_ = require 'lodash'

module.exports =
	available: () ->
		return ['miller', 'fix', 'simple', 'alternativeSimple', 'advanced', 'alternativeAdvanced', 'microbrewit']

	# Dave Miller, 1988
	miller: (og, fg) ->
		return ((og-fg)/0.75)*100

	# George Fix (Unimplemented)
	fix: null

	# Rule of thumb
	simple: (og, fg) ->
		return (og-fg)*131.25

	alternativeSimple: (og, fg) ->

		return ((1.05/0.79)*((og-fg/fg))*100)

	advanced: (og, fg) ->
		return (og-fg)*(100.3*(og-fg) + 125.65)

	alternativeAdvanced: (og, fg) ->
		return (76.08 * (og-fg) / (1.775-og)) * (fg / 0.794)

	microbrewit: (og, fg) ->
		return ((@alternativeSimple(og, fg)+@alternativeAdvanced(og,fg)+@simple(og, fg)+@advanced(og,fg)+@miller(og, fg))/5)


	calc: (og, fg, formula) ->
		formula = 'microbrewit' unless @[formula]
	
		calc = @[formula](og, fg)
		return if not _.isNaN(calc) then calc else 0
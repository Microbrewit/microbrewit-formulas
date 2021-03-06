// Generated by CoffeeScript 1.10.0
(function() {
  module.exports = {
    normalise: function(apparentAttenuationRange) {
      if (typeof apparentAttenuationRange.low === 'number' && typeof apparentAttenuationRange.high === 'number') {
        return apparentAttenuationRange;
      }
      apparentAttenuationRange = '' + apparentAttenuationRange.replace(/%/g, '').trim().toLowerCase();
      switch (apparentAttenuationRange) {
        case 'low':
          apparentAttenuationRange = '60-70';
          break;
        case 'medium':
          apparentAttenuationRange = '70-80';
          break;
        case 'med-high (77-84)':
          apparentAttenuationRange = '77-84';
          break;
        case 'med-high':
          apparentAttenuationRange = '77-84';
          break;
        case 'high':
          apparentAttenuationRange = '80-90';
          break;
        case 'very high':
          apparentAttenuationRange = '88-95';
          break;
        case '85+':
          apparentAttenuationRange = '85-90';
          break;
        case '80-85+':
          apparentAttenuationRange = '80-85';
          break;
        case '-80':
          apparentAttenuationRange = '75-80';
          break;
        case '':
          apparentAttenuationRange = '70-80';
          break;
        case 'na':
          apparentAttenuationRange = '70-80';
          break;
        case 'unknown':
          apparentAttenuationRange = '70-80';
      }
      if (apparentAttenuationRange.indexOf('>') !== -1) {
        apparentAttenuationRange = parseInt(apparentAttenuationRange.replace('>', ''));
        apparentAttenuationRange = apparentAttenuationRange + "-" + (apparentAttenuationRange + 5);
      }
      if (apparentAttenuationRange.indexOf('-') < 0) {
        apparentAttenuationRange = apparentAttenuationRange + "-" + apparentAttenuationRange;
      }
      apparentAttenuationRange = apparentAttenuationRange.split('-');
      return {
        low: apparentAttenuationRange[0],
        high: apparentAttenuationRange[1]
      };
    }
  };

}).call(this);

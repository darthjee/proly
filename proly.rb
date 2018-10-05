lib = './lib/'

$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)

autoload :Dinner, 'dinner'
autoload :Average, 'average'

require "./#{ARGV[0]}"

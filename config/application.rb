require './config/environment'
$:.unshift Config.root.join('lib')

# Load application
 [
   %w(models ** *.rb),
 ].each do |pattern|
    Dir.glob(Config.root.join(*pattern)).each { |file| require file }
end

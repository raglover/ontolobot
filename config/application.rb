require './config/environment'
$:.unshift Config.root.join('lib')

# Connect to database
OTR::ActiveRecord.configure_from_file! Config.root.join('config', 'database.yml')

# Load application
 [
   %w(models ** *.rb),
 ].each do |pattern|
    Dir.glob(Config.root.join(*pattern)).each { |file| require file }
end

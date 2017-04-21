$LOAD_PATH.unshift(File.dirname(__FILE__))

ENV['RACK_ENV'] ||= 'development'

require './config/application'
require 'dotenv'

Dotenv.load

require 'ontolobot'
require 'ontolobot/web'

Thread.abort_on_exception = true

Thread.new do
    begin
        OntoloBot::Bot.run
    rescue Exception => e
        STDERR.puts "ERROR: #{e}"
        STDERR.puts e.backtrace
        raise e
    end
end

run OntoloBot::Web

require 'sinatra/base'

module OntoloBot
    class Web < Sinatra::Base
        get '/' do
            print "<h1>Bot is running...</h1>"
        end
    end
end

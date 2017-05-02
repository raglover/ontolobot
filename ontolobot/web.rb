require 'sinatra'

module OntoloBot
    class Web < Sinatra::Base
        configure do 
            set :public_folder, settings.root + '/public'
            set :views, settings.root + '/assets/templates'
        end
        
        get '/' do
           render :html, :index 
        end

        get '/main.css' do
            scss :'scss/main'
        end
    end
end

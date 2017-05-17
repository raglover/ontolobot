require 'sinatra'
require 'json'

module OntoloBot
    class Web < Sinatra::Base
        configure do 
            set :public_folder, settings.root + '/public'
            set :views, settings.root + '/assets/templates'
        end
        
        get '/' do
           render :html, :index 
        end

        get '/data' do
            data = $db.zrevrange('lders', 0, -1, with_scores: :true)
            ld = []
            data.each do |d|
                camper = {name: d[0], score: d[1]}
                ld << camper
            end
            return ld.to_json
        end

        get '/main.css' do
            scss :'scss/main'
        end

    end
end

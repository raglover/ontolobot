module OntoloBot
    module Commands
        class Subtract < SlackRubyBot::Commands::Base

            match(/^\-(?<odollar>\d+) (?<first_name>\w+) ?(?<last_name>\w*)/i) do |client, data, match|
                @user = User.find_or_create_by(first_name: match[:first_name], last_name: match[:last_name])
                obucks = match[:odollar]
                @dollars = @user.ontolodollars.build(odollars: -obucks.to_i) 
                if @dollars.save
                    client.say(channel: data.channel, text: "#{match[:first_name]} #{match[:last_name]} has lost o$#{match[:odollar]}")
                else
                    client.say(channel: data.channel, text: "There was a problem with the OntoloDollar system! Talk to <@richie> about it.")
                end
            end
        end
    end
end


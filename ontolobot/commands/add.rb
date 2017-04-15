module OntoloBot
    module Commands
        class Add < SlackRubyBot::Commands::Base

            match(/^\+(?<odollar>\d+) (?<first_name>\w+) ?(?<last_name>\w*)/i) do |client, data, match|
                @user = User.find_or_create_by(first_name: match[:first_name], last_name: match[:last_name])
                @dollars = @user.ontolodollars.build(odollars: match[:odollar])
                if @dollars.save
                    client.say(channel: data.channel, text: "#{match[:first_name]} #{match[:last_name]} has had o$#{match[:odollar]} added to their account!")
                else
                    client.say(channel: data.channel, text: "Oops! Something went wrong, and the OntoloDollars weren't saved properly.")
                end
            end
        end
    end
end

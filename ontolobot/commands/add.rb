module OntoloBot
    module Commands
        class Add < SlackRubyBot::Commands::Base

            match(/^\+(?<odollar>\d+) (?<first_name>\w+) ?(?<last_name>\w*)/i) do |client, data, match|
                @user = User.new(name: match[:first_name] + " " + match[:last_name], odollars: match[:odollar])
                @dollars = @user.add
                if @dollars
                    client.say(channel: data.channel, text: "#{match[:first_name]} #{match[:last_name]} has had o$#{match[:odollar]} added to their account!")
                else
                    client.say(channel: data.channel, text: "Oops! Something went wrong, and the OntoloDollars weren't saved properly.")
                end
            end
        end
    end
end

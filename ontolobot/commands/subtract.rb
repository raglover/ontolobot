module OntoloBot
    module Commands
        class Subtract < SlackRubyBot::Commands::Base

            match(/^\-(?<odollar>\d+) (?<first_name>\w+) ?(?<last_name>\w*)/i) do |client, data, match|
                @user = User.new(name: match[:first_name] + " " +  match[:last_name], odollars: match[:odollar])
                @dollars = @user.subtract
                if @dollars
                    client.say(channel: data.channel, text: "#{match[:first_name]} #{match[:last_name]} has lost o$#{match[:odollar]}")
                else
                    client.say(channel: data.channel, text: "There was a problem with the OntoloDollar system! Talk to <@richie> about it.")
                end
            end
        end
    end
end


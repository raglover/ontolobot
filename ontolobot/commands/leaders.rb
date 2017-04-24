module OntoloBot
    module Commands
        class Leaders < SlackRubyBot::Commands::Base

            command 'leaders' do |client, data, match|
                @users = User.leaders
                msg = "The o$ Leaderboard\n\n"
                @users.each do |user|
                    msg += "#{user[0].titleize} with o$#{user[1]}\n"
                end
                client.say(channel: data.channel, text: msg)
            end
        end
    end
end

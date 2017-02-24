module Ruboty
  module DMM
    module Actions
      class Messenger < Ruboty::Actions::Base
        def call
          ranking = Ruboty::DMM::Ranking.new(message.body).call
          message.reply(ranking)
        rescue => exception
          message.reply("Failed by #{exception.class}")
        end
      end
    end
  end
end

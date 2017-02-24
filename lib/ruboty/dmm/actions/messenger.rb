module Ruboty
  module DMM
    module Actions
      class Messenger < Ruboty::Actions::Base
        def call
          ranking = Ruboty::DMM::Ranking.new(submedia: message.match_data[:submedia], term: message.match_data[:term]).call
          message.reply(ranking)
        rescue => exception
          message.reply("Failed by #{exception.class}")
        end
      end
    end
  end
end

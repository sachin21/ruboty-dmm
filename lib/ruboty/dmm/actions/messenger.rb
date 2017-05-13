module Ruboty
  module DMM
    module Actions
      class Messenger < Ruboty::Actions::Base
        def call
          attachments = Ruboty::DMM::Ranking.new(message.match_data).arts
          term = term_converter(message.match_data[:term])
          message.reply("#{term}のランキングです。", attachments: attachments) # temporary ignoring tags. I have to add interface for tags
        rescue => exception
          message.reply("Failed by #{exception.class}")
        end

        private

        def term_converter(term)
          case term
          when '24'
            '24時間'
          when 'weekly'
            '週間'
          when 'monthly'
            '月間'
          when 'total'
            '全体'
          else
            raise TypeError
          end
        end
      end
    end
  end
end

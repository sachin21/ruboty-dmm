module Ruboty
  module DMM
    module Actions
      class Fetcher < Ruboty::Actions::Base
        BASE_URL = 'http://www.dmm.co.jp'.freeze
        RANKING_URL = '/dc/doujin/-/ranking-all/=/sort=popular/submedia=cg/term='.freeze

        def call
          range = discriminate_argument
          books = page(range).search('.rank-rankListItem.fn-setPurchaseChange').map do |element|
            [
              element.search('.rank-name').first.text.strip,
              "#{BASE_URL}#{element.search('.rank-name').first.search('a').first.attributes.first[1].value}"
            ]
          end
          ranking = books.take(10).map.with_index(1) { |book, index| "#{index}位\nタイトル: #{book.first}\nURL: #{book.last}" }
          message.reply(ranking.join("\n\n"))
        rescue => exception
          message.reply("Failed by #{exception.class}")
        end

        private

        def client
          @client ||= Rdmm::Client.new(credentials)
        end

        def credentials
          {
            api_id:       ENV['API_ID'],
            affiliate_id: ENV['AFFILIATE_ID']
          }
        end

        def agent
          @agent ||= ::Mechanize.new
          @agent.user_agent_alias = 'Mac Safari'
          @agent.ignore_bad_chunking = true
          @agent.request_headers = { 'Accept-Encoding' => '' }
          @agent.ignore_bad_chunking = true
          @agent
        end

        def page(range)
          agent.get("#{BASE_URL}#{RANKING_URL}#{range.upcase}")
        end

        def discriminate_argument
          if message.body =~ /24/
            '24'
          elsif message.body =~ /weekly/
            'weekly'
          elsif message.body =~ /monthly/
            'monthly'
          elsif message.body =~ /total/
            'total'
          else
            raise TypeError
          end
        end
      end
    end
  end
end

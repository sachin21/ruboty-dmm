module Ruboty
  module DMM
    class Ranking
      BASE_URL = 'http://www.dmm.co.jp'.freeze
      RANKING_URL = '/dc/doujin/-/ranking-all/=/sort=popular/submedia=cg/term='.freeze

      def initialize(body)
        @type = discriminate_argument(body)
        @agent = Agent.new.agent
      end

      def call
        books = page.search('.rank-rankListItem.fn-setPurchaseChange').map do |element|
          [
            element.search('.rank-name').first.text.strip,
            "#{BASE_URL}#{element.search('.rank-name').first.search('a').first.attributes.first[1].value}"
          ]
        end
        ranking = books.take(10).map.with_index(1) { |book, index| "#{index}位\nタイトル: #{book.first}\nURL: #{book.last}" }
        ranking.join("\n\n")
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

      def page
        @agent.get("#{BASE_URL}#{RANKING_URL}#{@type.upcase}")
      end

      def discriminate_argument(body)
        if body =~ /24/
          '24'
        elsif body =~ /weekly/
          'weekly'
        elsif body =~ /monthly/
          'monthly'
        elsif body =~ /total/
          'total'
        else
          raise TypeError
        end
      end
    end
  end
end

module Ruboty
  module DMM
    class Ranking
      BASE_URL = 'http://www.dmm.co.jp'.freeze
      COLORS = %w(7acc28 9dcc28 cc2828 cc6e28 28a9cc 3428cc cc28b4 c0cc28 2886cc 28cca9).map { |hex| "##{hex}" }.freeze

      def initialize(arguments)
        @term = discriminate_term(arguments[:term])
        @submedia = discriminate_submedia(arguments[:submedia])
        @url = "#{BASE_URL}/dc/doujin/-/ranking-all/=/sort=popular/submedia=#{@submedia}/term=#{@term}"
        @agent = Agent.new.agent
      end

      def call
        books = page.search('.rank-rankListItem.fn-setPurchaseChange').map do |element|
          [
            element.search('.rank-name').first.text.strip,
            element.search('img').last.attributes['src'].value,
            "#{BASE_URL}#{element.search('.rank-name').first.search('a').first.attributes.first[1].value}"
          ]
        end
        books.take(10).zip(COLORS).map.with_index(1) { |((title, image, url), color), rank| { title: "#{rank}位: #{title}", title_link: url, image_url: image, color: color } }
      end

      private

      def credentials
        {
          api_id:       ENV['API_ID'],
          affiliate_id: ENV['AFFILIATE_ID']
        }
      end

      def page
        @agent.get(@url)
      end

      def discriminate_term(term)
        return term if %w(24 weekly monthly total).include?(term)
        raise TypeError
      end

      def discriminate_submedia(submedia)
        return submedia if %w(all weekly cg game voice).include?(submedia)
        raise TypeError
      end
    end
  end
end

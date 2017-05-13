module Ruboty
  module DMM
    class Ranking
      COLORS = %w(7acc28 9dcc28 cc2828 cc6e28 28a9cc 3428cc cc28b4 c0cc28 2886cc 28cca9).map { |hex| "##{hex}" }.freeze

       def initialize(arguments)
         @submedia = arguments[:submedia]
         @term = arguments[:term]
       end

       def arts
         arts = DMMCrawler::Ranking.new(submedia: submedia, term: term).arts.take(10)
         arts.zip(COLORS).map { |art, color| art.merge(color: color) }
       end

       private

       def term
         return @term if %w(24 weekly monthly total).include?(@term)
         raise TypeError
       end

       def submedia
         return @submedia if %w(all comic cg game voice).include?(@submedia)
         raise TypeError
       end
    end
  end
end

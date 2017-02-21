module Ruboty
  module Handlers
    class RubotyDMM < Base
      DESCRIPTION = 'Fetch rankings for DMM R18 only searchable for 24, weekly, monthly, total'.freeze
      on(
        /dmm ranking (?<type>.*?)\z/,
        name: 'fetcher',
        description: DESCRIPTION
      )

      def fetcher(message)
        Ruboty::DMM::Actions::Fetcher.new(message).call
      end
    end
  end
end

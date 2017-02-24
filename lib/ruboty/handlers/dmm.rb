module Ruboty
  module Handlers
    class RubotyDMM < Base
      DESCRIPTION = 'Fetch rankings for DMM R18 only searchable for 24, weekly, monthly, total'.freeze

      on(
        /dmm ranking (?<type>.*?)\z/,
        name: 'messenger',
        description: DESCRIPTION
      )

      def messenger(message)
        Ruboty::DMM::Actions::Messenger.new(message).call
      end
    end
  end
end

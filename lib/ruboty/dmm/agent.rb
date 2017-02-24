module Ruboty
  module DMM
    class Agent
      attr_accessor :agent

      def initialize
        @agent = ::Mechanize.new
        @agent.user_agent_alias = 'Mac Safari'
        @agent.ignore_bad_chunking = true
        @agent.request_headers = { 'Accept-Encoding' => '' }
        @agent.ignore_bad_chunking = true
      end
    end
  end
end

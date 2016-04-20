module Storage
  module Queries
    class Query
      def initialize(adapter:)
        self.adapter = adapter
      end

    protected

      attr_accessor :adapter
    end
  end
end

require_relative 'query'

module Storage
  module Queries
    class All < Query
      def call
        adapter.all
      end
    end
  end
end

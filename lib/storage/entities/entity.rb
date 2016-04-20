module Storage
  module Entities
    class Entity
      def self.factory
        method(:new)
      end

      def initialize
        yield self if block_given?
      end
    end
  end
end

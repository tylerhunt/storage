require 'storage/entities/user'

module Storage
  module Mappers
    class User
      def initialize(factory: Entities::User.factory)
        self.factory = factory
      end

      def load(record)
        factory.call do |item|
          item.id = record[:id]
          item.name = record[:name]
          item.age = record[:age]
        end
      end

    protected

      attr_accessor :factory
    end
  end
end

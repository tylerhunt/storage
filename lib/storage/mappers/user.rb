require 'storage/entities/user'

module Storage
  module Mappers
    class User
      def initialize(factory: Entities::User.factory)
        self.factory = factory
      end

      def dump(entity)
        {
          id: entity.id,
          name: entity.name,
          age: entity.age,
        }
      end

      def load(tuple)
        factory.call do |entity|
          entity.id = tuple[:id]
          entity.name = tuple[:name]
          entity.age = tuple[:age]
        end
      end

    protected

      attr_accessor :factory
    end
  end
end

require 'storage/mappers/user'
require 'storage/queries/users/younger_than'

require_relative 'repository'

module Storage
  module Repositories
    class Users < Repository
      AGE_OF_MAJORITY = 18

      def initialize(mapper: Mappers::User.new, **options)
        super
      end

      def minors(age_of_majority: AGE_OF_MAJORITY)
        younger_than age: age_of_majority
      end

      def younger_than(age:)
        query Queries::Users::YoungerThan, age: age
      end
    end
  end
end

require_relative '../query'

module Storage
  module Queries
    module Users
      class YoungerThan < Query
        def call(age:)
          adapter.younger_than(age: age)
        end
      end
    end
  end
end

require_relative 'adapter'

module Storage
  module Adapters
    module Sequel
      class Users < Adapter
        def younger_than(age:)
          dataset.where('age < ?', age)
        end
      end
    end
  end
end

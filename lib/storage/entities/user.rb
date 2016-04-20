require_relative 'entity'

module Storage
  module Entities
    class User < Entity
      attr_accessor :id
      attr_accessor :name
      attr_accessor :age
    end
  end
end

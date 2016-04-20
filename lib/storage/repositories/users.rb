require 'storage/mappers/user'

require_relative 'repository'

module Storage
  module Repositories
    class Users < Repository
      def initialize(mapper: Mappers::User.new, **options)
        super
      end
    end
  end
end

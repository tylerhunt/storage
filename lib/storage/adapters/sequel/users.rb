module Storage
  module Adapters
    module Sequel
      class Users
        def initialize(dataset:)
          self.dataset = dataset
        end

        def all
          dataset.all
        end

        def find(id)
          dataset.where(id: id).first
        end

      protected

        attr_accessor :dataset
      end
    end
  end
end

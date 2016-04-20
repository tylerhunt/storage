module Storage
  module Adapters
    module Sequel
      class Adapter
        Error = Class.new(StandardError)

        UndefinedQuery = Class.new(Error) do
          attr_accessor :name

          def initialize(name)
            self.name = name
            super "adapter does not define query: #{name}"
          end
        end

        def initialize(dataset:)
          self.dataset = dataset
        end

        def all
          dataset.all
        end

        def delete(id)
          find(id).delete
          self
        end

        def insert(tuple)
          tuple[:id] = dataset.insert(tuple)
          self
        end

        def query(name, *args)
          raise UndefinedQuery, name unless respond_to?(name)
          send name, *args
        end

        def retrieve(id)
          find(id).first
        end

        def update(id, tuple)
          find(id).update tuple
          self
        end

      protected

        attr_accessor :dataset

      private

        def find(id)
          dataset.where(id: id)
        end
      end
    end
  end
end

module Storage
  module Repositories
    class Repository
      Error = Class.new(StandardError)
      NotFound = Class.new(Error)

      def initialize(adapter:, mapper:)
        self.adapter = adapter
        self.mapper = mapper
      end

      def all
        query :all
      end

      def destroy(entity)
        tuple = dump(entity)
        adapter.delete tuple[:id]
        self
      end

      def find(id)
        tuple = adapter.retrieve(id)
        raise NotFound unless tuple
        load(tuple)
      end

      def persist(entity)
        unless entity.id
          create entity
        else
          update entity
        end

        self
      end

    protected

      attr_accessor :adapter
      attr_accessor :mapper

    private

      def dump(entity)
        mapper.dump(entity)
      end

      def create(entity)
        tuple = dump(entity)
        adapter.insert tuple
        entity.id = tuple[:id]
      end

      def load(tuple)
        mapper.load(tuple)
      end

      def update(entity)
        tuple = dump(entity)
        id = tuple.delete(:id)
        adapter.update id, tuple
      end

      def query(name, *args)
        tuples = adapter.query name, *args
        tuples.lazy.collect(&method(:load))
      end
    end
  end
end

module Storage
  module Repositories
    class Repository
      def initialize(adapter:, mapper:)
        self.adapter = adapter
        self.mapper = mapper
      end

      def all
        adapter.all.lazy.collect(&method(:load))
      end

      def find(id)
        tuple = adapter.find(id)
        load(tuple)
      end

      def persist(entity)
        unless entity.id
          insert entity
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

      def insert(entity)
        tuple = dump(entity)
        adapter.insert tuple
        entity.id = tuple[:id]
      end

      def update(entity)
        tuple = dump(entity)
        id = tuple.delete(:id)
        adapter.update id, tuple
      end

      def load(tuple)
        mapper.load(tuple)
      end
    end
  end
end

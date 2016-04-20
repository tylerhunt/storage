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

    protected

      attr_accessor :adapter
      attr_accessor :mapper

    private

      def load(tuple)
        mapper.load(tuple)
      end
    end
  end
end

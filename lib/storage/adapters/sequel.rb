module Storage
  module Adapters
    class Sequel
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

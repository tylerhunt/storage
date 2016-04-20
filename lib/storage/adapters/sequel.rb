module Storage
  module Adapters
    class Sequel
      def initialize(dataset:)
        self.dataset = dataset
      end

      def all
        dataset.all
      end

      def find(id)
        dataset.where(id: id).first
      end

      def insert(tuple)
        tuple[:id] = dataset.insert(tuple)
        self
      end

      def update(id, tuple)
        dataset.where(id: id).update tuple
        self
      end

    protected

      attr_accessor :dataset
    end
  end
end

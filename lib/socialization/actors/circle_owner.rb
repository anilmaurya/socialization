module ActiveRecord
  class Base
    def is_circle_owner?
      false
    end
    alias circle_owner? is_circle_owner?
  end
end

module Socialization
  module CircleOwner
    extend ActiveSupport::Concern

    included do
      #after_destroy { Socialization.circle_owner_model.remove_circle(self) }

      # Specifies if self can be owner of circle.
      #
      # @return [Boolean]
      def is_circle_owner?
        true
      end
      alias circle_owner? is_circle_owner?

      # create a new Circle
      def create_circle!(options={})
        raise Socialization::ArgumentError, "circle name not be empty! Use case create_circle({name: 'test_circle'})" unless options[:name].present?
        Socialization.circle_owner_model.create_circle!(options[:name])
      end
      
      def remove_circle!(options={})
        raise Socialization::ArgumentError, "circle name not be empty! Use case remove_circle({name: 'test_circle'})" unless options[:name].present?
        Socialization.circle_owner_model.create_circle!(options[:name])
      end

      def circles
        Socialization.circle_owner_model.circles
      end

    end

  end
end

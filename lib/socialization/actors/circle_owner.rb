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
      def create_circle(options={})
        raise Socialization::ArgumentError, "circle name not be empty! Use case create_circle({name: 'test_circle'})" unless options[:name].present?
        Socialization.circle_model.create_circle(options[:name], self.id)
      end
      
      def remove_circle!(options={})
        raise Socialization::ArgumentError, "circle name not be empty! Use case remove_circle({name: 'test_circle'})" unless options[:name].present?
        Socialization.circle_model.create_circle!(options[:name])
      end

      def circles
        Socialization.circle_model.where(circle_owner_id: self.id)
      end

      def circle_member_ids(options={})
        raise Socialization::ArgumentError, "circle id cannot be empty! Use case circle_member_ids({circle_id: id})" unless options[:circle_id].present?
        Socialization.circle_member_model.member_ids(options[:circle_id])
      end

      def in_circle_ids
        Socialization.circle_member_model.where(circle_member_id: self.id).collect(&:circle_id).uniq
      end

      def have_user_in_circle_ids
        Socialization.circle_model.where(id: self.in_circle_ids).collect(&:circle_owner_id).uniq
      end
    end

  end
end

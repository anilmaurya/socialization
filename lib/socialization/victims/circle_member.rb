module ActiveRecord
  class Base
    def is_circle_member?
      false
    end
    alias circle_member? is_circle_member?
  end
end

module Socialization
  module CircleMember
    extend ActiveSupport::Concern

    included do
      #after_destroy { Socialization.circle_owner_model.remove_circle(self) }

      # Specifies if self can be owner of circle.
      #
      # @return [Boolean]
      def is_circle_member?
        true
      end
      alias circle_member? is_circle_member?


      def add_circle_member!(options={})
        raise Socialization::ArgumentError, "circle id and member id cannot be empty! Use case add_circle_member({circle_id: n, member_id: m})" unless options[:circle_id].present? || options[:member_id].present?
        if options[:circle_id].is_a?(Array)
          options[:circle_id].each do |circle_id|
            Socialization.circle_member_model.add_member!(circle_id, options[:member_id])
          end
        else
          Socialization.circle_member_model.add_member!(options[:circle_id], options[:member_id])
        end
      end

      def remove_circle_member!(options={})
        raise Socialization::ArgumentError, "circle id and member id cannot be empty! Use case remove_circle_member({circle_id: n, member_id: m})" unless options[:circle_id].present? || options[:member_id].present?
        Socialization.circle_member_model.remove_member!(options[:circle_id], options[:member_id])
      end

      def member_circle_ids(options={})
        raise Socialization::ArgumentError, "member id cannot be empty! Use case circle_ids({member_id: m})" unless options[:member_id].present?
        self_circle_ids = self.circles.collect(&:id)
        Socialization.circle_member_model.circle_ids(options[:member_id], self_circle_ids)
      end

    end

  end
end

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

    end

  end
end

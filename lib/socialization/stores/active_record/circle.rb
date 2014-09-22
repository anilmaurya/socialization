module Socialization
  module ActiveRecordStores
    class Circle < ActiveRecord::Base
      extend Socialization::Stores::Mixins::Base

      belongs_to :circle_owner
      has_many :circle_members, :dependent => :destroy

      class << self

        def create_circle!(name, circle_owner_id)
          self.create! do |circle|
            circle.name = name
            circle.circle_owner_id = circle_owner_id
          end
        end
      end

    end
  end
end

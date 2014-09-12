module Socialization
  module ActiveRecordStores
    class CircleOwner < ActiveRecord::Base
      extend Socialization::Stores::Mixins::Base

      has_many :circles, :dependent => :destroy

      class << self
        def create_circle!(circle_name)
          self.circles.create(name: circle_name)
        end

        def remove_circle!(circle_name)
          circle = self.circles.where(name: circle_name).first
          circle.destroy if circle
        end
      end

    end
  end
end

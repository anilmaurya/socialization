module Socialization
  module ActiveRecordStores
    class CircleOwner < ActiveRecord::Base
      extend Socialization::Stores::Mixins::Base

      has_many :circles, :dependent => :destroy

      class << self
        def create_circle!(circle_name)
          self.circles.create(name: circle_name)
        end
      end

    end
  end
end

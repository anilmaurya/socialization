module Socialization
  module ActiveRecordStores
    class CircleMember < ActiveRecord::Base
      extend Socialization::Stores::Mixins::Base

      belongs_to :circle

      class << self
        
      end

    end
  end
end

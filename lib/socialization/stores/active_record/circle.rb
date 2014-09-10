module Socialization
  module ActiveRecordStores
    class Circle < ActiveRecord::Base
      extend Socialization::Stores::Mixins::Base

      belongs_to :circle_owner
      has_many :circle_members, :dependent => :destroy

      class << self
        
      end

    end
  end
end

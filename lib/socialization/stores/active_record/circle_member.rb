module Socialization
  module ActiveRecordStores
    class CircleMember < ActiveRecord::Base
      extend Socialization::Stores::Mixins::Base

      belongs_to :circle

      class << self

        def add_member!(circle_id, member_id)
          self.create! do |member|
            member.circle_id = circle_id
            member.circle_member_id = member_id
          end
        end 

        def remove_member!(circle_id, member_id)
          self.where(circle_id: circle_id, circle_member_id: member_id).destroy_all
        end

        def member_ids(circle_id)
          self.where(circle_id: circle_id).collect(&:circle_member_id)
        end

        def circle_ids(member_id)
          self.where(circle_member_id: member_id).collect(&:circle_id)
        end

      end
    end
  end

end

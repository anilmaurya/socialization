module Socialization
  class << self

    def circle_model
      if @circle_model
        @circle_model
      else
        ::Circle
      end
    end

    def circle_owner_model
      if @circle_owner_model
        @circle_owner_model
      else
        ::CircleOwner
      end
    end

    def circle_member_model
      if @circle_member_model
        @circle_member_model
      else
        ::CircleMember
      end
    end

    def circle_owner_model=(klass)
      @circle_owner_model = klass
    end

    def follow_model
      if @follow_model
        @follow_model
      else
        ::Follow
      end
    end

    def follow_model=(klass)
      @follow_model = klass
    end

    def like_model
      if @like_model
        @like_model
      else
        ::Like
      end
    end

    def like_model=(klass)
      @like_model = klass
    end

    def mention_model
      if @mention_model
        @mention_model
      else
        ::Mention
      end
    end

    def mention_model=(klass)
      @mention_model = klass
    end
  end
end

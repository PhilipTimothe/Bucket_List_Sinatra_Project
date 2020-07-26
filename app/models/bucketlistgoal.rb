class BucketListGoals < ActiveRecord::Base
    belongs_to :user
    belongs_to :BucketList
end
class Bucketlist < ActiveRecord::Base
    belongs_to :user
    belongs_to :bucketlistgoal
end
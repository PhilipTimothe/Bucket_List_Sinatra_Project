class Bucketlistgoal < ActiveRecord::Base
    belongs_to :user
    belongs_to :bucketlist
end
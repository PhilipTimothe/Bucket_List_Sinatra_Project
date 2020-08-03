class Bucketlistgoal < ActiveRecord::Base
    has_many :bucketlists
    has_many :users, through: :bucketlists
end
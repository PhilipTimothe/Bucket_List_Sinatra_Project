class User < ActiveRecord::Base
    has_many :bucketlists
    has_many :bucketlistgoals, through: :bucketlists
end
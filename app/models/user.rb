class User < ActiveRecord::Base
    has_secure_password
    has_many :bucketlists
    has_many :bucketlistgoals
end
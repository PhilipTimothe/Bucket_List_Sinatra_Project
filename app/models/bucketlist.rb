class Bucketlist < ActiveRecord::Base
    has_many :bucketlistgoals
    belongs_to :user
end
class Bucketlistgoal < ActiveRecord::Base
    belongs_to :user
    validates :goal, :description, presence: true
end
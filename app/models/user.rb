class User < ActiveRecord::Base
    has_secure_password
    validates :email, :user_name, presence: true
    validates :email, :user_name, uniqueness: true
    has_many :bucketlistgoals
end
class CreateBucketListGoals < ActiveRecord::Migration
  def change
    create_table :bucketlistgoals do |t|
      t.string :goal
      t.boolean :completed
      t.string :user_id
      t.string :bucketlist_id
    end
  end
end

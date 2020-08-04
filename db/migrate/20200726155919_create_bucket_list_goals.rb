class CreateBucketListGoals < ActiveRecord::Migration
  def change
    create_table :bucketlistgoals do |t|
      t.string :goal
      t.boolean :completed
      t.integer :bucketlist_id
    end
  end
end

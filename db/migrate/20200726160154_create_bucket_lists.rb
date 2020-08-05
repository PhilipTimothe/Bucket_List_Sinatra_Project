class CreateBucketLists < ActiveRecord::Migration
  def change
    create_table :bucketlistgoals do |t|
      t.string :goal
      t.boolean :completed
      t.integer :user_id
    end
  end
end

class CreateBucketListGoals < ActiveRecord::Migration
  def change
    create_table :bucketlistgoals do |t|
      t.string :goal
      t.boolean :completed
    end
  end
end

class CreateBucketLists < ActiveRecord::Migration
  def change
    create_table :bucketlists do |t|
      t.string :bucketlistname
      t.integer :user_id
      t.integer :bucketlistgoal_id
    end
  end
end

class CreateBucketLists < ActiveRecord::Migration
  def change
    create_table :bucketlists do |t|
      t.string :bucketlist
      t.string :user_id
    end
  end
end

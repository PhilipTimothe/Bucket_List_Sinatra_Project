class CreateBucketList < ActiveRecord::Migration
  def change
    create_table :bucketlist do |t|
      t.string :goals
      t.boolean :completed
      t.string :user_id
    end
  end
end

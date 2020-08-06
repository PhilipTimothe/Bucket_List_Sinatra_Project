class AddDescriptionToGoal < ActiveRecord::Migration
  def change
    add_column :bucketlistgoals, :description, :string
  end
end

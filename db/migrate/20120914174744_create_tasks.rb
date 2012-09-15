class CreateTasks < ActiveRecord::Migration
  def change
    create_table :tasks do |t|
      t.string :name
      t.string :description
      t.integer :priority
      t.timestamp :deadline
      t.integer :status_id
      t.integer :user_id
      t.integer :project_id
      t.timestamps
    end
  end
end

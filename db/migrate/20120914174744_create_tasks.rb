class CreateTasks < ActiveRecord::Migration
  def change
    create_table :tasks do |t|
      t.string :name
      t.string :description
      t.integer :priority
      t.timestamp :deadline

      t.timestamps
    end
  end
end

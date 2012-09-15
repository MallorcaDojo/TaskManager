class CreateProjects < ActiveRecord::Migration
  def change
    create_table :projects do |t|
      t.string :name

      t.timestamps
    end
    
    create_table :projects_users do |t|
      t.integer :project_id
      t.integer :user_id
    end
  end
end

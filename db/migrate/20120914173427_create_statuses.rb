class CreateStatuses < ActiveRecord::Migration
  def change
    create_table :statuses do |t|
      t.String :name
      t.String :description

      t.timestamps
    end
  end
end

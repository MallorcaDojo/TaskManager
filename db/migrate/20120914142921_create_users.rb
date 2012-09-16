class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :lastname
      t.string :firstname
      t.date :birthday
      t.string :email
      t.string :password_digest
      t.string :password

      t.timestamps
    end
  end
end

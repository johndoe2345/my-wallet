class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :email, null: false, unique: true
      t.string :password, null: false
      t.string :phone, null: false
      t.string :fname, null: false
      t.string :lname, null: false

      t.timestamps null: false
    end
  end
end

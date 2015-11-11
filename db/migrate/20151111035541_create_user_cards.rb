class CreateUserCards < ActiveRecord::Migration
  def change
    create_table :user_cards do |t|
      t.integer :user_id
      t.integer :debit_card_id

      t.timestamps null: false
    end
  end
end
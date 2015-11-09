class CreateDebitCards < ActiveRecord::Migration
  def change
    create_table :debit_cards do |t|
      t.references :user, null: false
      t.string :card_num, null: false
      t.string :card_type, null: false
      t.integer :exp_mon, null: false
      t.integer :exp_year, null: false
      t.decimal :balance

      t.timestamps null: false
    end
  end
end

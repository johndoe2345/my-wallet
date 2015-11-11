class CreatedUserCardsTableAgain < ActiveRecord::Migration
  def change
  	create_table :user_cards do |t|
      t.belongs_to :user, index: true
      t.belongs_to :debit_card, index: true

      t.timestamps null: false
    end
  end
end

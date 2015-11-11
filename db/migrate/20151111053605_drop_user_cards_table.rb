class DropUserCardsTable < ActiveRecord::Migration
  def change
  	drop_table :user_cards
  end
end

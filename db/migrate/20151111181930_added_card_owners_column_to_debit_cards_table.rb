class AddedCardOwnersColumnToDebitCardsTable < ActiveRecord::Migration
 def self.up
   add_column :debit_cards, :card_owner_id, :integer
 end

 def self.down
   remove_column :debit_cards, :card_owner_id
 end
end

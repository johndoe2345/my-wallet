class RemoveUserIdColumnInDebitCardTable < ActiveRecord::Migration
  def change
  	remove_column(:debit_cards, :user_id)
  end
end

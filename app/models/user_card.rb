class UserCard < ActiveRecord::Base
	belongs_to :user
	belongs_to :debit_card
end

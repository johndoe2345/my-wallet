class DebitCard < ActiveRecord::Base
	belongs_to :user

	validates_presence_of :card_num, :exp_mon, :exp_year
	validates_numericality_of :card_num, only_integer: true
	validates :card_num, length: {in: 15..16}
	validates :exp_mon, inclusion: {in: 1..12, message: " is not a valid month. Please enter a 2 digit month"}, length: {in: 1..2, message: " is not a valid month. Please enter a 2 digit month"}
	validates :exp_year, length: {is: 4, message: " is not a valid year. Please enter a 4 digit year"}
	validates_numericality_of :exp_mon, only_integer: true
	validates_numericality_of :exp_year, greater_than_or_equal_to: 2015, :message => " is already expired. Please enter a valid expiration year"
	validates_numericality_of :exp_year, only_integer: true
	validate :valid_card_num

	before_save :card_type_check

	def card_type_check
		if self.card_num.starts_with?("37")
			self.card_type =  "American Express"
		elsif self.card_num.starts_with?("38")
			self.card_type = "Diners Club"
		elsif self.card_num.starts_with?("4")
			self.card_type = "Visa"
		elsif self.card_num.starts_with?("5")
			self.card_type = "MasterClub"
		elsif self.card_num.starts_with?("6")
			self.card_type = "Discover"
		else
			self.card_type = "Undefined Travel Card"
		end
	end

	private

	def valid_card_num
  	errors.add(:card_num, " is not a valid debit card type. Please double-check the card number") unless card_num.start_with?('3', '4', '5', '6')
	end

end

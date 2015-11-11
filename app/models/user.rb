class User < ActiveRecord::Base
	has_many :debit_cards, through: :user_cards
	has_many :user_cards
	validates_presence_of :email, :password, :fname, :lname
	validates :password, confirmation: true, length: { minimum: 4 }
	validates :email, uniqueness: true
	validates :phone, format: { with: /\d{3}-\d{3}-\d{4}/, message: " number needs to be in xxx-xxx-xxxx format"}

	def full_name
		if !fname.empty? && !lname.empty?
			fname.capitalize+" "+lname.capitalize
		elsif !fname.empty?
			fname.capitalize
		elsif !lname.empty?
			lname.capitalize
    elsif fname.empty? && lname.empty?
      username
		end
  end

end

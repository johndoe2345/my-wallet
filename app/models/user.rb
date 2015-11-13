class User < ActiveRecord::Base
	has_many :debit_cards, through: :user_cards
	has_many :user_cards

	has_secure_password
	validates_confirmation_of :password
	validates_presence_of :password, on: :create
	
	validates_presence_of :email, :fname, :lname
	validates :password, length: { minimum: 4 }
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
      email
		end
  end

  # like the "following?" method from the microblog, this checks if user already has a particular card shared with them.
  def has_card?(debit_card_id)
    cards = user_cards.collect {|f| f.debit_card_id}
    cards.include?(debit_card_id)
  end

end

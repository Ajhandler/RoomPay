class Membership < ActiveRecord::Base
	belongs_to :user
	belongs_to :group

	scope :is_accepted, -> { where(accepted: true)}
	after_create :send_invite_mail

	def accept
		update_attributes accepted: true
	end

	def send_invite_mail
	end
end

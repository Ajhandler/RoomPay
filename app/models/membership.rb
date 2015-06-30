class Membership < ActiveRecord::Base
	belongs_to :user
	belongs_to :group

	scope :is_accepted, -> { where(accepted: true)}

	def accept
		update_attributes accepted: true
	end
end

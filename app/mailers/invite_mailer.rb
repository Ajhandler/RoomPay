class InviteMailer < ApplicationMailer
	default from: "info@website.com"

	def send_invite(membership)
		@membership = membership 
		send(to: membership.user.email)
	end
end

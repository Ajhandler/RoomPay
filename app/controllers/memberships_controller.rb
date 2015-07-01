class MembershipsController < ApplicationController
	def new
		@membership = Membership.new 
	end
	def create
		user =	User.find_by!(email: member_params[:email])
		group = current_user.groups.find(member_params[:group_id])

		user.memberships.create(group_id: group.id)
	end

	def update

	end

	private

	def member_params
		params.require(:membership).permit(:email, :group_id)
	end
end
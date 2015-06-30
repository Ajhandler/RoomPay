class GroupsController < ApplicationController
  before_action :set_group, only: [:show, :edit, :update, :destroy]

  respond_to :html

  def index
    @groups = current_user.groups
    respond_with(@groups)
  end

  def show
    @group = current_user.groups.find(params[:id])
    respond_with(@group)
  end

  def new
    @group = Group.new
    respond_with(@group)
  end

  def edit
  end

  def create
    #create a group ans save the current user to it
    @group = current_user.groups.create group_params
    respond_with(@group)
  end

  def update
    @group.update(group_params)
    respond_with(@group)
  end

  def destroy
    @group.destroy
    respond_with(@group)
  end

  private
    def set_group
      @group = Group.find(params[:id])
    end

    def group_params
      params.require(:group).permit(:name)
    end
end

class DashboardsController < ApplicationController
  def show
    @invitations = Invitation.where(user: current_user)
    @events = Event.where(user: current_user)
  end

  def edit
    @user = current_user
  end

  def update
    @user = current_user
    @user.update(user_params)
    redirect_to dashboards_path
  end

  private

  def user_params
    params.require(:user).permit(:name, :role)
  end

end

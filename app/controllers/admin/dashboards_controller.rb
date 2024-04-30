class Admin::DashboardsController < ApplicationController
   before_action :authenticate_admin!

  layout 'admin'
  #before_action :authenticate_admin!
  def index
      @users = User.all
  end
end

class UsersController < ApplicationController
  before_action :authenticate_user!

  def show
    @user = User.find(params[:id])
  end

  # outras ações aqui, como edit, update, etc., se necessário
end

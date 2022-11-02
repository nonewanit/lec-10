class MainController < ApplicationController
  def login
  end

  def create
    u = User.where(login: params[:login]).first
    if u && u.authenticate(params[:password])
      redirect_to main_user_items_path
      session[:logged_in] = true
      session[:user] = u.id
    else
      redirect_to main_login_path, notice: 'wrong login or password'
    end
  end

  def destroy
    reset_session
  end

  def user_items
    must_be_logged_in
    u = session[:user]
    @db = Item.where(user_id: u)
  end

  def inventories
    must_be_logged_in
    u = session[:user]
    @db = Inventory.where(user_id: u)
  end
end

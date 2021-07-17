class UsersController < ApplicationController
  def show
    @created_events = current_user.events
  end
end

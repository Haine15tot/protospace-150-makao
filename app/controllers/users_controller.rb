class UsersController < ApplicationController
  def show
    @prototype = current_user.prototypes
  end
end

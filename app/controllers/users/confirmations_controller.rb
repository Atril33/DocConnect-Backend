class Users::ConfirmationsController < Devise::ConfirmationsController

  private

  def after_confirmation_path_for(resource_name, resource)
    'http://localhost:3001/login'
  end
end

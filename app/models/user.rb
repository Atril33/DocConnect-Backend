class User < ApplicationRecord
  include Devise::JWT::RevocationStrategies::JTIMatcher

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, :confirmable,
         :jwt_authenticatable, jwt_revocation_strategy: self

  has_many :appointments

  enum role: { user: 'user', admin: 'admin' }
  
  def admin?
    role.to_sym == :admin
  end
end

class Ability
  include CanCan::Ability

  def initialize(user)

    user ||= User.new

    if user.admin?
      can :create, Doctor
    end

    can :read, Appointment, user_id: user.id
  end
end

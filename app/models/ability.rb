class Ability
  include CanCan::Ability

  def initialize(user)

    user ||= User.new

    can :read, :all

    if user.admin?
      can :manage, Doctor
    end

    can :manage, Appointment, user_id: user.id
  end
end

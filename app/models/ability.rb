class Ability
  include CanCan::Ability

  def initialize(user)
    user ||= User.new

    can :read, :all


    if user.persisted?

      can :manage, :all, user: user

    end
  end

end

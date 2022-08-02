class Ability
  include CanCan::Ability

  def initialize(user)
    user ||= User.new # guest user (not logged in)
    can :read, :all
    if user.admin? :admin
      can :manage, :all
    else
      can :manage, Group, user_id: user.id
      can :manage, Expense, user_id: user.id
      can :read, :all
    end

    # See the wiki for details:
    # https://github.com/CanCanCommunity/cancancan/blob/develop/docs/define_check_abilities.md
  end
end

# frozen_string_literal: true

class Ability
  include CanCan::Ability

  def initialize(admin_user)
    admin_user ||= AdminUser.new
    if admin_user.role == 'admin'
      can :manage, :all
      can :update, :all
    elsif admin_user.role=='user'
      can :read, :all
      cannot :manage, Professor
      can :create, Review
      can :read, Review
      can :update, Review
      can :destroy, Review
    elsif admin_user.role=='banned'
      can :read, :all
      cannot :create, :all
      cannot :destroy, :all
      cannot :update, :all
    else
      can :read, :all
      cannot :create, Review
      cannot :create, Professor
      cannot :create, Declaration
      cannot :update, Review
      cannot :update, Professor
      cannot :update, Declaration
      cannot :destroy, Review
      cannot :destroy, Professor
      cannot :destroy, Declaration    end
    # Define abilities for the passed in user here. For example:
    #
    #   user ||= User.new # guest user (not logged in)
    #   if user.admin?
    #     can :manage, :all
    #   else
    #     can :read, :all
    #   end
    #
    # The first argument to `can` is the action you are giving the user
    # permission to do.
    # If you pass :manage it will apply to every action. Other common actions
    # here are :read, :create, :update and :destroy.
    #
    # The second argument is the resource the user can perform the action on.
    # If you pass :all it will apply to every resource. Otherwise pass a Ruby
    # class of the resource.
    #
    # The third argument is an optional hash of conditions to further filter the
    # objects.
    # For example, here the user can only update published articles.
    #
    #   can :update, Article, :published => true
    #
    # See the wiki for details:
    # https://github.com/CanCanCommunity/cancancan/wiki/Defining-Abilities
  end
end

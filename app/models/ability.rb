class Ability
  include CanCan::Ability
  def initialize(user)
    if user.nil?
      can :read, Post
    elsif user.is?(:admin)
      can :manage, Post
    else
      can %i[read create], Post
      can %i[update destroy], Post, author_id: user.id
    end
  end
end

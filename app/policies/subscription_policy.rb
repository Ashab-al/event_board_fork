class SubscriptionPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope.all
    end
  end

  def can_join?
    return false if @user == @record.event.user
    return !@record.event.subscribers.include?(@user) if @user.present?
    true
  end

  def destroy?
    @user == @record.user 
  end
end

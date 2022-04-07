class EventPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope.all
    end
  end
  
  def edit?
    update?
  end

  def update?
    @user == @record.user
  end

  def destroy?
    update?
  end

  def can_leave?
    @record.subscribers.include?(@user)
  end
end

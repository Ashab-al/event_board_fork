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
    current_user_can_edit?(@record)
  end

  def destroy?
    update?
  end
end

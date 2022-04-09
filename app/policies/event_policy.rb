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

  def add_pictures?
    is_member?
  end

  def gallery?
    is_member?
  end

  def can_leave?
    @record.subscribers.include?(@user)
  end

  private

    def is_member?
      @record.subscribers.include?(@user) || @record.user == @user
    end
end

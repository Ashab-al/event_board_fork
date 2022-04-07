class ArticlePolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope.all end
  end

  def create?
    return !(@user.subscriptions.map(&:event) + @user.events).empty?
  end

  def update?
    @user == @record.user
  end

  def new?
    create?
  end

  def edit?
    update?
  end
end

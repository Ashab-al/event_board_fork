class UserPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
       scope.all
    end

    def index
      @user.has_role? :admin
    end
  end
end

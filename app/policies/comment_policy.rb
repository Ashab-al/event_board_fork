class CommentPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope.all
    end
  end

  def destroy?
    [@record.user, @record.article.user].include?(@user)
  end

  def destroy_all?
    ArticlePolicy.new(@user, @record.first.article).edit?
  end
end

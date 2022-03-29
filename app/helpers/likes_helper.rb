module LikesHelper
  def likes_count(article)
    " #{article.likes_count}" 
  end

  def heart(article, user)
    if article.likes.find_by(user: user).present?
      "❤️ "
    else
      "🤍"
    end
  end
end

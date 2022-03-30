module ApplicationHelper
  def model_picture(model)
    return model&.image if model&.image&.present?
    asset_path("#{model.class.to_s.downcase}.jpg")
  end
end

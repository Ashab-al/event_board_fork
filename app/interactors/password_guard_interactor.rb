class PasswordGuardInteractor
  include Interactor
  include Devise
  include Devise::Controllers::Helpers

  def call
    event = context.event
    pincode = context.pincode 
    puts "asdADSASDASD"
    puts context
    puts "ASDASDASD"
    context.success if event.pincode.blank?
    context.success if signed_in? && current_user == event.user

    if pincode.present? && event.pincode_valid?(pincode)
      cookies.permanent["events_#{event.id}_pincode"] = pincode
    end

    unless event.pincode_valid?(cookies.permanent["events_#{event.id}_pincode"])
      context.fail(message: I18n.t('controllers.events.wrong_pincode')) if pincode.present?
      context.fail(message: 'Invalid pincode')
    end
  end
end
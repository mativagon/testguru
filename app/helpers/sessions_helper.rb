module SessionsHelper
  def flash_message
    flash.map do |key, message|
      content_tag :p, message, class: "flash #{key}" if message.present?
    end.join
  end
end

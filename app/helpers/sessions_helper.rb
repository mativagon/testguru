module SessionsHelper
  def flash_message
    flash.map do |key, message|
      content_tag( :div, sanitize(message, attributes: %w[href target]), class: "alert alert-#{key}")
    end.join
  end
end

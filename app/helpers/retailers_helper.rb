module RetailersHelper
  def render_errors(object)
    if object.errors.any?
      content_tag :ul do
        object.errors.full_messages.collect { |message| content_tag(:li, message) }.join('').html_safe
      end
    end
  end
end

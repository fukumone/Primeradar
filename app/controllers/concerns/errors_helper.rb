module ErrorsHelper
  def format_errors(obj)
    if obj.errors.count == 1
      obj.errors.full_messages.join('<br />').html_safe
    elsif obj.errors.count > 1
      obj.errors.full_messages.first.html_safe
    end
  end
end

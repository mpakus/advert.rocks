module ApplicationHelper
  ##
  # Show flash messages
  def flash_message(flash)
    out = ""
    flash.each do |name, msg|
      if msg.is_a?(String) && !msg.blank? && !name.blank?
        out << %Q{
          <div class="alert alert-#{name == :notice ? "success" : "error"}">
            <a class="close" onClick="$(this).parent().fadeOut(300)">&times;</a>
            #{content_tag(:div, msg, :id => "flash_#{name}")}
          </div>
        }
      end
    end
    raw out
  end

  ##
  # Show form validation errors
  def form_errors(form, show_field=true)
    html = ''
    if form.errors.any?
      plural = Russian::pluralize(form.errors.count, 'ошибка', 'ошибки', 'ошибок')
      html = %Q{
        <div class="alert alert-error">
          <a class="close" onClick="$(this).parent().fadeOut(300)">&times;</a>
          <div>#{form.errors.count} #{plural} в форме:</div>
          <ul>
      }
      form.errors.each do |field, msg|
        html += (show_field) ? "<li>#{field} #{msg}</li>" : "<li>#{msg}</li>"
      end
      html += "
        </ul>
      </div>"
    end
    return raw(html)
  end
end

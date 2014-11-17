module VideosHelper
  def emojify(msg)
    msg.gsub(/\B:[-+\w]+:/, &method(:replace))
  end

  private

  def replace(match)
    name = match[/\A:(.+):\z/, 1]
    @index ||= Emoji::Index.new
    emoji = @index.find_by_name(name)
    unless emoji.nil?
      emoji_url = Emoji.image_url_for_name(name)
      options   = {size: "32x32", title: name, alt: match, class: "emoji"}
      image_tag(emoji_url, options)
    else
      match
    end
  end

end

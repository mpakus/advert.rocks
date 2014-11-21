class VideoManager
  def self.get_info(url)
    # video.available?       => true
    # video.video_id         => "x7lni3"
    # video.provider         => "Dailymotion"
    # video.title            => "Mario Kart (Rémi Gaillard)"
    # video.description      => "Super Rémi Kart est un jeu vidéo de course développé et édité par N'Importe Quoi TV."
    # video.duration         => 136 (in seconds)
    # video.date             => Mon Mar 03 16:29:31 UTC 2008
    # video.thumbnail_small  => "http://s2.dmcdn.net/BgWxI/x60-kbf.jpg"
    # video.thumbnail_medium => "http://s2.dmcdn.net/BgWxI/x240-b83.jpg"
    # video.thumbnail_large  => "http://s2.dmcdn.net/BgWxI/x720-YcV.jpg"
    # video.embed_url        => "http://www.dailymotion.com/embed/video/x7lni3"
    # video.embed_code
    video = VideoInfo.new(url)
    {
      url:         url,
      title:       video.title,
      description: video.description,
      uploaded_on: video.date,
      duration:    video.duration,
      embed_url:   video.embed_url,
      embed_code:  video.embed_code({iframe_attributes: {class: 'video-show', width: 800, height: 600}}),
      origin_thumbnail: video.thumbnail_large,
      remote_image_url: video.thumbnail_large
    }
  end
end
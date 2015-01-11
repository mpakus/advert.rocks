class @VideoRate
  constructor: (@class_over)->
    $(@class_over).on 'click', '.video-rate', @on_click

  on_click: (e)->
    el     = $(@)
    url    = el.data('url')
    act    = el.data('act')
    video_rating = el.parent().find('.video-rating')
    $.post url, {act: act}, (data)->
      video_rating.html(data.video.rating)
    e.preventDefault()
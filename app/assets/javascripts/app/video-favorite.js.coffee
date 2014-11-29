class @VideoFavorite
  constructor: (@class_over)->
    $(@class_over).on 'click', '.video-favorite', @on_click

  on_click: (e)->
    el  = $(@)
    url = el.data('url')
    $.post url, (data)->
      if data.status
        el.removeClass('glyphicon glyphicon-star-empty').addClass('glyphicon glyphicon-star')
      else
        el.removeClass('glyphicon glyphicon-star').addClass('glyphicon glyphicon-star-empty')
    e.preventDefault()
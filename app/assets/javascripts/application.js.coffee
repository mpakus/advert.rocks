#= require jquery
#= require jquery_ujs
#= require bootstrap-sprockets
#= require nprogress
#= require nprogress-turbolinks
#= require turbolinks
#= require_directory ./libs/
#= require_directory ./app/

advert_init = ->
  @video_favorite = new VideoFavorite('.bio')
  @video_rate     = new VideoRate('.bio')

  videos = $('.videos')
  if videos.length
    videos.isotope
      masonry:
        columnWidth: '.col-md-4'
      itemSelector: '.video'
    .isotope('layout')

    videos.infinitescroll
      navSelector  : '#page_nav'
      nextSelector : '#page_nav a'
      itemSelector : '.video'
      loadingText  : 'Loading...'
      animate      : true
      donetext     : 'THE END'
    , (newElements) ->
      videos.isotope('appended', $(newElements)).isotope('layout')

$(document).on 'page:load', -> advert_init()
$(document).ready           -> advert_init()

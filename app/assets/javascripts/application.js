// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or any plugin's vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require jquery_ujs
//= require turbolinks
//= require_tree .
// jQuery ->
//   $('body').prepend('<div id="fb-root"></div>')

//   $.ajax
//     url: "#{window.location.protocol}//connect.facebook.net/en_US/all.js"
//     dataType: 'script'
//     cache: true


// window.fbAsyncInit = ->
//   FB.init(appId: '1535368836776174', cookie: true)

//   $('#sign_in').click (e) ->
//     e.preventDefault()
//     FB.login (response) ->
//       window.location = '/auth/facebook/callback' if response.authResponse

//   $('#sign_out').click (e) ->
//     FB.getLoginStatus (response) ->
//       FB.logout() if response.authResponse
//     true
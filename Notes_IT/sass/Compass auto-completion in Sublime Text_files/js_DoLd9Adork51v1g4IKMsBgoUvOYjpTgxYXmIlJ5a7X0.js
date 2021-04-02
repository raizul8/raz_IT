/**
 * @file
 * JavaScript for the Disqus Drupal module.
 */

// The Disqus global variables.
var disqus_shortname = '';
var disqus_url = '';
var disqus_title = '';
var disqus_identifier = '';
var disqus_developer = 0;
var disqus_def_name = '';
var disqus_def_email = '';
var disqus_config;

(function ($) {

/**
 * Drupal Disqus behavior.
 */
Drupal.behaviors.disqus = {
  attach: function (context, settings) {
    $('body').once('disqus', function() {
      // Load the Disqus comments.
      if (settings.disqus || false) {
        // Setup the global JavaScript variables for Disqus.
        disqus_shortname = settings.disqus.domain;
        disqus_url = settings.disqus.url;
        disqus_title = settings.disqus.title;
        disqus_identifier = settings.disqus.identifier;
        disqus_developer = settings.disqus.developer || 0;
        disqus_def_name = settings.disqus.name || '';
        disqus_def_email = settings.disqus.email || '';

        // Language and SSO settings are passed in through disqus_config().
        disqus_config = function() {
          if (settings.disqus.language || false) {
            this.language = settings.disqus.language;
          }
          if (settings.disqus.remote_auth_s3 || false) {
            this.page.remote_auth_s3 = settings.disqus.remote_auth_s3;
          }
          if (settings.disqus.api_key || false) {
            this.page.api_key = settings.disqus.api_key;
          }
          if (settings.disqus.sso || false) {
            this.sso = settings.disqus.sso;
          }
          if (settings.disqus.callbacks || false) {
            for (var key in settings.disqus.callbacks) {
              for (var i = 0; i < settings.disqus.callbacks[key].length; i++) {
                var callback = settings.disqus.callbacks[key][i].split('.');
                var fn = window;
                for (var j = 0; j < callback.length; j++) {
                  fn = fn[callback[j]];
                }
                if(typeof fn === 'function') {
                  this.callbacks[key].push(fn);
                }
              }
            }
          }
        };

        // Make the AJAX call to get the Disqus comments.
        jQuery.ajax({
          type: 'GET',
          url: '//' + disqus_shortname + '.disqus.com/embed.js',
          dataType: 'script',
          cache: false
        });
      }

      // Load the comment numbers JavaScript.
      if (settings.disqusComments || false) {
        disqus_shortname = settings.disqusComments;
        // Make the AJAX call to get the number of comments.
        jQuery.ajax({
          type: 'GET',
          url: '//' + disqus_shortname + '.disqus.com/count.js',
          dataType: 'script',
          cache: false
        });
      }
    });
  }
};

})(jQuery);
;
(function ($) {

  Drupal.behaviors.fredParke = {
    attach: function (context, settings) {

      // Waypoints.
      var nodes = $(".view-taxonomy-term .node--teaser");
      // Run the waypoint.
      if (typeof $().waypoint == 'function') {
        // Use jquery waypoint to fade in items when they come into view.
        nodes.waypoint(function() {
          // Add some random delay to the animations.
          var min = 100, max = 200;
          var delay = Math.floor(Math.random() * (max - min) + min);
          $(this).delay(delay).fadeTo(400, 1);
        },{
          offset: '100%'
        });

        // Header flourish.
        $('.l-page').waypoint(function(direction) {
          // Going down.
          if (direction === 'down') {
            $('.header-wrapper, .l-page').addClass('fixed-nav');
          }
          // Going up.
          if (direction === 'up') {
            $('.header-wrapper, .l-page').removeClass('fixed-nav');
          }
        }, {
          offset: '-50px'
        });
      }

      // Abridge.
      $('.field--name-field-abridge').click(function() {
        $(this).toggleClass('abridge-enabled');

        if ($(this).hasClass('abridge-enabled')) {
          $('.unabridged').hide(500);
          $('.abridged').show(500);
          $('.bridge-text').html('Want more?<br />See the unabridged version');
        }
        else {
          $('.unabridged').show(500);
          $('.abridged').hide(500);
          $('.bridge-text').html('Too Long?<br />See the abridged version');
        }
      });

    }
  };

})(jQuery);
;

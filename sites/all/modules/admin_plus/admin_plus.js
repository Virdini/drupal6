(function() {

  $.fn.flexNav = function(options) {
    var $nav, $sneaky_div, base_font, breakpoint, em_unit, hidden_text, nav_count, nav_open, resizer, settings, transition;
    settings = $.extend({
      'transitionSpeed': '0.4s',
      'itemHeight': 50
    }, options);
    $nav = $(this);
    nav_open = false;
    transition = 'all ' + settings.transitionSpeed + ' ease-in-out';
    $nav.find("li").each(function() {
      var $sub_nav, count;
      if ($(this).has("ul").length) {
        $(this).addClass("item-with-ul");
        $sub_nav = $(this).find('>ul');
        count = $sub_nav.find('li').length;
        $sub_nav.attr("data-height", settings.itemHeight * count);
        return $nav.attr("data-height", settings.itemHeight * count);
      }
    });
    nav_count = $nav.find('li').length;
    $nav.attr("data-height", settings.itemHeight * nav_count);
    if ($nav.data('breakpoint')) {
      breakpoint = $nav.data('breakpoint');
    }
    if ($nav.data('breakpoint-em')) {
      hidden_text = "<div class='hidden-text'>M and FlexNav</div>";
      $('body').append(hidden_text);
      $sneaky_div = $('.hidden-text');
      $sneaky_div.css({
        'display': 'inline-block',
        'padding': '0',
        'line-height': '1',
        'position': 'absolute',
        'visibility': 'hidden',
        'font-size': '1em'
      });
      em_unit = $nav.data('breakpoint-em');
      base_font = $sneaky_div.css('font-size');
      breakpoint = em_unit * parseInt(base_font);
      console.log(breakpoint);
      $sneaky_div.remove();
    }
    resizer = function() {
      if ($(window).width() <= breakpoint) {
        $nav.removeClass("lg-screen").addClass("sm-screen");
        $nav.css({
          "maxHeight": 0
        }).find(".item-with-ul ul").css({
          "maxHeight": 0
        });
        $('.one-page li a').on('click', function() {
          return $nav.removeClass('show');
        });
        return $('.item-with-ul').off();
      } else {
        $nav.removeClass("sm-screen").addClass("lg-screen");
        $nav.removeClass('show');
        $nav.css({
          "maxHeight": settings.itemHeight
        }).find(".item-with-ul ul").css({
          "maxHeight": 0
        });
        return $('.item-with-ul').on({
          mouseenter: function() {
            return $(this).find('>ul').addClass('show');
          },
          mouseleave: function() {
            return $(this).find('>ul').removeClass('show');
          }
        });
      }
    };
    $(".flexnav, .item-with-ul ul, .show").css({
      WebkitTransition: transition,
      MozTransition: transition,
      MsTransition: transition,
      OTransition: transition,
      transition: transition
    });
    $('.item-with-ul, .menu-button').append('<span class="touch-button"><i class="navicon">&#9660;</i></span>');
    $('.menu-button, .menu-button .touch-button').on('touchstart click', function(e) {
      var nav_drop_height;
      e.stopPropagation();
      e.preventDefault();
      nav_drop_height = $nav.data("height");
      if (nav_open === false) {
        $nav.css({
          "maxHeight": nav_drop_height
        }).addClass('show');
        return nav_open = true;
      } else if (nav_open === true) {
        $nav.css({
          "maxHeight": 0
        }).removeClass('show');
        return nav_open = false;
      }
    });
    $('.touch-button').on('touchstart click', function(e) {
      var $sub, drop_height;
      e.stopPropagation();
      e.preventDefault();
      $sub = $(this).parent('.item-with-ul').find('>ul');
      drop_height = $sub.data("height");
      if ($nav.hasClass('lg-screen') === true) {
        $(this).parent('.item-with-ul').siblings().find('ul.show').removeClass('show');
      }
      if ($sub.hasClass('show') === true) {
        return $sub.css({
          "maxHeight": 0
        }).removeClass('show');
      } else if ($sub.hasClass('show') === false) {
        return $sub.css({
          "maxHeight": drop_height
        }).addClass('show');
      }
    });
    $('.item-with-ul *').focus(function() {
      $(this).parent('.item-with-ul').parent().find(".open").not(this).removeClass("open");
      return $(this).parent('.item-with-ul').find('>ul').addClass("open");
    });
    resizer();
    return $(window).on('resize', resizer);
  };

}).call(this);

/**
 * Admin toolbarPlus methods.
 */
Drupal.behaviors.adminToolbarPlus = function(context) {
    //Drupal.adminToolbarPlus.init();
    $("#admin-plus-toolbar .flexnav").before('<div class="menu-button">Menu</div>');
    if (!$(document.body).hasClass('admin-horizontal_plus')) {  
        $(document.body).addClass('admin-horizontal_plus');
    }
    
    /* Fix Admin Menu  */
    var countmenus = $(".horizontal_plus ul").children('li.top-level').length;
    if($(window).width()<800) {
        $('.horizontal_plus .flexnav li.top-level').css('width','100%');
    } else {
        $('.horizontal_plus .flexnav li.top-level').css('width',100/countmenus+'%');
    }
    $(window).resize(function () {
        if($(window).width()<800) {
            $('.horizontal_plus .flexnav li.top-level').css('width','100%');
        } else {
            $('.horizontal_plus .flexnav li.top-level').css('width',100/countmenus+'%');
        }
    });
    $('.horizontal_plus ul').each(function() {
        var depth = $(this).parents('ul').length;
        $(this).addClass('plus-level-' + depth);
        if(depth==1 && $(this).parent().attr('id')=='admin-tab-admin-menu'){
            if($(this).children().length==1) {
                inner = $(this).children().html();
                $(this).parent().html(inner);
            }  
        }
        if($(this).find('form') && depth==1)  $(this).addClass('plus-form');
    }); 
    $('.horizontal_plus ul .item-list').each(function() {
        topitem = $(this).parent();
        inner = $(this).html();
        $(this).remove();
        topitem.append(inner);
    });
        
    $("#admin-plus-toolbar .flexnav").flexNav();
    $("#admin-plus-toolbar .flexnav").css('visibility','visible');
}

Drupal.adminToolbarPlus = {};

/**
 * Set the initial state of the toolbarPlus.
 */
Drupal.adminToolbarPlus.init = function () {
  
  if (!$(document.body).hasClass('admin-horizontal_plus')) {  
    $(document.body).addClass('admin-horizontal_plus');
  }
  
 
  
  /* Msie Fix */
  if ($.browser.msie && $.browser.version.substr(0,1)<7) {
    $('li').has('ul').mouseover(function(){
      $(this).children('ul').css('visibility','visible');
    }).mouseout(function(){
      $(this).children('ul').css('visibility','hidden');
    })
  }  
  
  /* Mobile */
  $('.horizontal_plus').prepend('<div id="menu-trigger">Menu</div>');		
  $("#menu-trigger").bind("click", function(){
    $(".horizontal_plus ul").slideToggle();
  });          
  
  /* iPad */
  var isiPad = navigator.userAgent.match(/iPad/i) != null;
  if (isiPad) $('.horizontal_plus ul').addClass('no-transition');
  
  /* Devel */
  memory = $('.dev-memory-usage:not(li.dev-memory-usage)').html();
  $('#admin-block-devel-form .dev-memory-usage .dev-info').html(memory);
  
  // Query list show handler.
  $('input.dev-querylog-show').click(function() {
    $(this).hide().siblings('input.dev-querylog-hide').show();
    $('body > .devel-querylog').show();
    return false;
  });
  // Query list hide handler.
  $('input.dev-querylog-hide').click(function() {
    $(this).hide().siblings('input.dev-querylog-show').show();
    $('body > .devel-querylog').hide();
    return false;
  });
  $('.horizontal_plus .admin-pane-title a').click(function() {
    $('.horizontal_plus .admin-pane-title a').removeClass('admin-pane-active');
    $(this).addClass('admin-pane-active');
    return false;
  });
}
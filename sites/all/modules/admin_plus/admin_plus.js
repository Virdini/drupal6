/**
 * Admin toolbarPlus methods.
 */

Drupal.behaviors.adminToolbarPlus = function(context) {
    // Set initial toolbarPlus state.
    Drupal.adminToolbarPlus.init();
}

Drupal.adminToolbarPlus = {};

/**
 * Set the initial state of the toolbarPlus.
 */
Drupal.adminToolbarPlus.init = function () {
  
  if (!$(document.body).hasClass('admin-horizontal_plus')) {  
    $(document.body).addClass('admin-horizontal_plus');
  }
  
  /* Fix Admin Menu  */
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
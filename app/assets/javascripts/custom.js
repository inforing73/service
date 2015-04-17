function fix() {
  var heightPrice = [];
  $('.repair .item.active .pricing .content li.service_id').each(function(i) {
  	heightPrice.clea
  	heightPrice.push($(this).height());
	});
	$('.repair .item.active .pricing .content li.price_id').each(function(i) {
		var fix = i % heightPrice.length; 

  	$(this).css('height', heightPrice[fix] - (heightPrice[fix] / 2 - 5));
		$(this).css('padding-top', (heightPrice[fix] / 2 - 5));
		$(this).css('padding-bottom', (heightPrice[fix] / 2 + 15));
		if (document.body.clientWidth < 767) {
			$(this).css('padding-top', (heightPrice[fix] / 2));
			$(this).css('padding-bottom', (heightPrice[fix] / 2 + 10));
		}

	});
}

(function($) {
  $(document).ready(function() {
    $.slidebars();

    setTimeout(function() {
	    $('div.alert').slideUp();
	  }, 2000);

	  $('.bxslider').bxSlider({
      pagerCustom: '#bx-pager',
      controls: false
		});

    $('body').click(function (e) {
    	var target = $(e.target);
    	if(!target.is('.well')) {
      	$('.well iframe').css("pointer-events", "none");
    	} else {
    		$('.well iframe').css("pointer-events", "auto");
    	}
		});

  	fix();

  	$(".call").on("click", function() {
  		$("a").addClass("active");
  	});

	  $(".collapseOne").on("click", function() {
		  setTimeout(function() {
		  	$("#collapseOne").collapse('show');
		  	$('#collapseOne').addClass('animated').addClass('bounceIn').addClass('animation-delay-4');
			  setTimeout(function() {
			  	$('#collapseOne').removeClass('animated').removeClass('bounceIn').removeClass('animation-delay-4');
			  }, 2000);
		  }, 1000);
		});
		$(".collapseTwo").on("click", function() {
		  setTimeout(function() {
		  	$("#collapseTwo").collapse('show');
		  	$('#collapseTwo').addClass('animated').addClass('bounceIn').addClass('animation-delay-4');
			  setTimeout(function() {
			  	$('#collapseTwo').removeClass('animated').removeClass('bounceIn').removeClass('animation-delay-4');
			  }, 2000);
		  }, 1000);
		});
		$(".collapseThree").on("click", function() {
		  setTimeout(function() {
		  	$("#collapseThree").collapse('show');
		  	$('#collapseThree').addClass('animated').addClass('bounceIn').addClass('animation-delay-4');
			  setTimeout(function() {
			  	$('#collapseThree').removeClass('animated').removeClass('bounceIn').removeClass('animation-delay-4');
			  }, 2000);
		  }, 1000);
		});
		$(".collapseFour").on("click", function() {
		  setTimeout(function() {
		  	$("#collapseFour").collapse('show');
		  	$('#collapseFour').addClass('animated').addClass('bounceIn').addClass('animation-delay-4');
			  setTimeout(function() {
			  	$('#collapseFour').removeClass('animated').removeClass('bounceIn').removeClass('animation-delay-4');
			  }, 2000);
		  }, 1000);
		});
		$('#accordion').on('show.bs.collapse', function () {
		  $('#accordion .in').collapse('hide');
		});

		function toggleIcon(e) {
	  	$(e.target)
	  		.prev('.panel-heading')
	  		.toggleClass('plus minus')
	  }
	  $('.panel').on('hidden.bs.collapse', toggleIcon);
	  $('.panel').on('shown.bs.collapse', toggleIcon);
		
		$("li > a.dropdown-toggle").click(function(e) {
    	e.stopPropagation();
		});	

		$(".content-box a[href^='#']").on('click', function(e) {
      e.preventDefault();
      $('html, body').animate({
          scrollTop: $(this.hash).offset().top
      }, 1000);
	  });

		$('#priceCarousel').carousel({
    	interval: false
		});
		
		var clickEvent = false;
		$('#priceCarousel').on('click', '.nav a', function() {
				clickEvent = true;
				$('.nav li').removeClass('active');
				$(this).parent().addClass('active');
		}).on('slid.bs.carousel', function(e) {
			fix();
			if(!clickEvent) {
				var count = $('.nav').children().length -1;
				var current = $('.nav li.active');
				current.removeClass('active').next().addClass('active');
			}
			clickEvent = false;
		});

		$(".scroll-up").hide();
		$(window).scroll(function() {
	  	if ($(this).scrollTop() > 100) {
	  		$('.scroll-up').fadeIn();
	  	} else {
	  		$('.scroll-up').fadeOut();
	  	}
	  });
	  $('.scroll-up').click(function() {
	  	$("html, body").animate({
	  		scrollTop: 0
	  	}, 600);
	  	return false;
	  });

	  $(window).scroll(function(){	
	  	"use strict";	
	  	var scroll = $(window).scrollTop();
	  	if( scroll > 160 ){		
	  		$("header").addClass("header-shrink");	
	  		$(".empty").addClass("active");			
	  	} else {
	  		$("header").removeClass("header-shrink");
	  		$(".empty").removeClass("active");			
	  	}
	  });
  });
}) (jQuery);

jQuery(window).bind("orientationchange",function(e){
	fix();
});

;(function($) {

	$.slidebars = function(options) {

		var settings = $.extend({
			siteClose: true, 
			disableOver: false,
			hideControlClasses: false 
		}, options);

		var test = document.createElement('div').style,
		supportTransition = false,
		supportTransform = false;

		if (test.MozTransition === '' || test.WebkitTransition === '' || test.OTransition === '' || test.transition === '') supportTransition = true;

		if (test.MozTransform === '' || test.WebkitTransform === '' || test.OTransform === '' || test.transform === '') supportTransform = true;

		var ua = navigator.userAgent,
		android = false,
		iOS = false;
		
		if (/Android/.test(ua)) { 
			android = ua.substr(ua.indexOf('Android')+8, 3); 
		} else if (/(iPhone|iPod|iPad)/.test(ua)) {
			iOS = ua.substr(ua.indexOf('OS ')+3, 3).replace('_', '.'); 
		}
		
		if (android && android < 3 || iOS && iOS < 5) $('html').addClass('slidebar-static');

		if (!$('#wrap').length) $('body').children().wrapAll('<div id="wrap" />');
		var $site = $('#wrap'); 
		if (!$site.parent().is('body')) $site.appendTo('body');

		if ($('.slidebar-left').length) {
			var $left = $('.slidebar-left'),
			leftActive = false; 
			$left.addClass('slidebar'); 
			if (!$left.parent().is('body')) $left.appendTo('body'); 
		}

		if ($('.slidebar-right').length) {
			var $right = $('.slidebar-right'), 
			rightActive = false; 
			$right.addClass('slidebar'); 
			if (!$right.parent().is('body')) $right.appendTo('body');
		}
				
		var init = false,
		windowWidth = $(window).width(),
		$controls = $('.slidebar-toggle-left, .slidebar-toggle-right, .slidebar-open-left, .slidebar-open-right, .slidebar-close'), 
		$slide = $('.slidebar-slide');
		
		function initialise() {
			if (!settings.disableOver || (typeof settings.disableOver === 'number' && settings.disableOver >= windowWidth)) { 
				init = true;
				$('html').addClass('slidebar-init');
				if (settings.hideControlClasses) $controls.removeClass('slidebar-hide'); 
			} else if (typeof settings.disableOver === 'number' && settings.disableOver < windowWidth) {
				init = false; // false stop Slidebars from opening.
				$('html').removeClass('slidebar-init'); // Remove helper class.
				if (settings.hideControlClasses) $controls.addClass('slidebar-hide'); // Hide controls
				if (leftActive || rightActive) close(); // Close Slidebars if open.
			}
		}
		initialise();
		
		// Inline CSS
		function css() {
			// Set minimum height.
			//$site.css('minHeight', ''); // Reset minimum height.
			//$site.css('minHeight', $('body').height() + 'px'); // Set minimum height of the site to the minimum height of the body.
			
			// Set off-canvas margins for Slidebars with push and overlay animations.
			if ($left && ($left.hasClass('slidebar-style-push') || $left.hasClass('slidebar-style-overlay'))) $left.css('marginLeft', '-' + $left.css('width'));
			if ($right && ($right.hasClass('slidebar-style-push') || $right.hasClass('slidebar-style-overlay'))) $right.css('marginRight', '-' + $right.css('width'));
			
			// Custom Slidebar Widths
			if ($left && $left.hasClass('slidebar-width-custom')) $left.css('width', $left.attr('data-slidebar-width')); // Set user custom width.
			if ($right && $right.hasClass('slidebar-width-custom')) $right.css('width', $right.attr('data-slidebar-width')); // Set user custom width.
		}
		css();
		
		// Resize Functions
		$(window).resize(function() {
			var resizedWindowWidth = $(window).width(); // Get resized window width.
			if (windowWidth !== resizedWindowWidth) { // Window was actually resized.
				windowWidth = resizedWindowWidth; // Set the new window width.
				initialise(); // Call initalise to see if Slidebars should still be running.
				css(); // Reset minimum heights and negative margins.
				if (leftActive) open('left'); // If left Slidebar is open, calling open will ensure it is the correct size.
				if (rightActive) open('right'); // If right Slidebar is open, calling open will ensure it is the correct size.
			}
		});
		// I may include a height check along side a width check here in future.

		// ---------------
		// 005 - Animation

		var animation; // Animation type.

		// Set Animation Type
		if (supportTransition && supportTransform) { // Browser supports css transitions and transforms.
			animation = 'translate'; // Translate for browsers that support it.
			if (android && android < 4.4) animation = 'side'; // Android supports both, but can't translate any fixed positions, so use left instead.
		} else {
			animation = 'jQuery'; // Browsers that don't support css transitions and transitions.
		}

		// Animate Mixin
		function animate(object, amount, side) {
            // Choose selectors depending on animation style.
            var selector;
            
            if (object.hasClass('slidebar-style-push')) {
                selector = $site.add(object).add($slide); // Push - Animate site, Slidebar and user elements.
            } else if (object.hasClass('slidebar-style-overlay')) {
                selector = object; // Overlay - Animate Slidebar only.
            } else {
                selector = $site.add($slide); // Reveal - Animate site and user elements.
            }
            
            // Apply animation
            if (animation === 'translate') {
                selector.css('transform', 'translate(' + amount + ')');

            } else if (animation === 'side') {      
                if (amount[0] === '-') amount = amount.substr(1); // Remove the '-' from the passed amount for side animations.
                selector.css(side, amount);

            } else if (animation === 'jQuery') {
                if (amount[0] === '-') amount = amount.substr(1); // Remove the '-' from the passed amount for jQuery animations.
                var properties = {};
                properties[side] = amount;
                selector.stop().animate(properties, 400); // Stop any current jQuery animation before starting another.
            }
            
            // If closed, remove the inline styling on completion of the animation.
            setTimeout(function() {
                if (amount === '0px') {
                    selector.removeAttr('style');
                    css();
                }
            }, 400);
		}

		// ----------------
		// 006 - Operations

		// Open a Slidebar
		function open(side) {
			// Check to see if opposite Slidebar is open.
			if (side === 'left' && $left && rightActive || side === 'right' && $right && leftActive) { // It's open, close it, then continue.
				close();
				setTimeout(proceed, 400);
			} else { // Its not open, continue.
				proceed();
			}

			// Open
			function proceed() {
				if (init && side === 'left' && $left) { // Slidebars is initiated, left is in use and called to open.
					$('html').addClass('slidebar-active slidebar-active-left'); // Add active classes.
					$left.addClass('slidebar-active').addClass('animated').addClass('fadeIn').addClass('animation-delay-2');
					animate($left, $left.css('width'), 'left'); // Animation
					setTimeout(function() { leftActive = true; }, 400); // Set active variables.
				} else if (init && side === 'right' && $right) { // Slidebars is initiated, right is in use and called to open.
					$('html').addClass('slidebar-active slidebar-active-right'); // Add active classes.
					$right.addClass('slidebar-active').addClass('animated').addClass('fadeIn').addClass('animation-delay-2');
					animate($right, '-' + $right.css('width'), 'right'); // Animation
					setTimeout(function() { rightActive = true; }, 400); // Set active variables.
				}
			}
		}
			
		// Close either Slidebar
		function close(link) {
			if (leftActive || rightActive) { // If a Slidebar is open.
				if (leftActive) {
					animate($left, '0px', 'left'); // Animation
					leftActive = false;
				}
				if (rightActive) {
					animate($right, '0px', 'right'); 
					rightActive = false;
				}
			
				setTimeout(function() {
					$('html').removeClass('slidebar-active slidebar-active-left slidebar-active-right'); // Remove active classes.
					if ($left) $left.removeClass('slidebar-active').removeClass('animated').removeClass('fadeIn').removeClass('animation-delay-2');
					if ($right) $right.removeClass('slidebar-active').removeClass('animated').removeClass('fadeIn').removeClass('animation-delay-2');
					if (link) window.location = link; // If a link has been passed to the function, go to it.
				}, 1);
			}
		}
		
		// Toggle either Slidebar
		function toggle(side) {
			if (side === 'left' && $left) { // If left Slidebar is called and in use.
				if (!leftActive) {
					open('left'); // Slidebar is closed, open it.
				} else {
					close(); // Slidebar is open, close it.
				}
			}
			if (side === 'right' && $right) { // If right Slidebar is called and in use.
				if (!rightActive) {
					open('right'); // Slidebar is closed, open it.
				} else {
					close(); // Slidebar is open, close it.
				}
			}
		}

		// ---------
		// 007 - API

		this.open = open; // Maps user variable name to the open method.
		this.close = close; // Maps user variable name to the close method.
		this.toggle = toggle; // Maps user variable name to the toggle method.
		this.init = function() { // Returns true or false whether Slidebars are running or not.
			return init;
		};
		this.active = function(side) { // Returns true or false whether Slidebar is open or closed.
			if (side === 'left' && $left) return leftActive;
			if (side === 'right' && $right) return rightActive;
		};

		// ----------------
		// 008 - User Input
		
		function eventHandler(event, selector) {
			event.stopPropagation(); // Stop event bubbling.
			event.preventDefault(); // Prevent default behaviour
			if (event.type === 'touchend') selector.off('click'); // If event type was touch turn off clicks to prevent phantom clicks.
		}
		
		// Toggle Left Slidebar
		$('.slidebar-toggle-left').on('touchend click', function(event) {
			eventHandler(event, $(this)); // Handle the event.
			toggle('left'); // Toggle the left Slidbar.
		});
		
		// Toggle Right Slidebar
		$('.slidebar-toggle-right').on('touchend click', function(event) {
			eventHandler(event, $(this)); // Handle the event.
			toggle('right'); // Toggle the right Slidbar.
		});
		
		// Open Left Slidebar
		$('.slidebar-open-left').on('touchend click', function(event) {
			eventHandler(event, $(this)); // Handle the event.
			open('left'); // Open the left Slidebar.
		});
		
		// Open Right Slidebar
		$('.slidebar-open-right').on('touchend click', function(event) {
			eventHandler(event, $(this)); // Handle the event.
			open('right'); // Open the right Slidebar.
		});
		
		// Close a Slidebar
		$('.slidebar-close').on('touchend click', function(event) {
			eventHandler(event, $(this)); // Handle the event.
			close(); // Close either Slidebar.
		});
		
		// Close Slidebar via Link
		$('.slidebar-slidebar a').not('.slidebar-disable-close').on('click', function(event) {
			eventHandler(event, $(this)); // Handle the event.
			close( $(this).attr('href') ); // Close the Slidebar and pass link.
		});
		
		// Close Slidebar via Site
		$site.on('touchend click', function(event) {
			if (settings.siteClose && (leftActive || rightActive)) { // If settings permit closing by site and left or right Slidebar is open.
				eventHandler(event, $(this)); // Handle the event.
				close(); // Close it.
			}
		});
		
	}; // End slidebars function.

}) (jQuery);

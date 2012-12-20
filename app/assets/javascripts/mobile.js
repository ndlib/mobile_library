
     $(document).bind('mobileinit', function () {

         $.mobile.loadingMessageTheme = 'c';
         $.mobile.loadingMessageTextVisible = false;
         $.mobile.allowCrossDomainPages = true;
         $.support.cors = true;
         $.mobile.page.prototype.options.addBackBtn = "true";
         $.mobile.page.prototype.options.backBtnTheme = "b";
         $.mobile.page.prototype.options.backBtnText = "back";

     });




     $(document).bind('pageinit', function(e, data){

         $( "#popupMap" ).on({
             popupbeforeposition: function() {
                 var maxHeight = $( window ).height() - 30 + "px";
                 $("#popupMap img").css( "max-height", maxHeight );
                 $.mobile.loading( 'hide' );
             }

         });



         $('#popupLink').click(function() {
             $("#popupMap").popup("open")
             return false;
          });

     });






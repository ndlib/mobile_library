
     $(document).bind('mobileinit', function () {

         $.mobile.loadingMessageTheme = 'c';
         $.mobile.loadingMessageTextVisible = false;

        }).live('[data-role="page"]', 'click', function () {
             if (!$(this).hasClass( "mobileDBLink" ))
                $.mobile.showPageLoadingMsg("c","",false);

        });




     $(".mobileDBLink").click(function(){
alert("mobiledb")
     });



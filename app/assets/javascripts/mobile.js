
     $(document).bind('mobileinit', function () {

         $.mobile.loadingMessageTheme = 'c';
         $.mobile.loadingMessageTextVisible = false;
         $.mobile.page.prototype.options.backBtnTheme = "b";
         $.mobile.page.prototype.options.backBtnText = "back";
         $.mobile.page.prototype.options.mini = "true";

        }).live('[data-role="page"]', 'click', function () {
             if (!$(this).hasClass( "mobileDBLink" ))
                $.mobile.showPageLoadingMsg("c","",false);

        });







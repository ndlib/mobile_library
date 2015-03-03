
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

         $( ".popupMap" ).on({
             popupbeforeposition: function() {
                 var maxHeight = $( window ).height() - 30 + "px";
                 $(".popupMap img").css( "max-height", maxHeight );
                 $.mobile.loading( 'hide' );
             }

         });
         
         $('.popupLink').click(function() {
             $(".popupMap").popup("open")
             return false;
          });


        getServiceHours({hesburgh: '#hesburgh_destination',circulation: '#circulation_destination',computer_lab: '#computer_lab_destination',lower_level_service_desk: '#lower_level_service_desk_destination',medieval: '#medieval_destination',music_and_media: '#music_and_media_destination',reference: '#reference_destination',special_collection: '#special_collection_destination',archives: '#archives_destination',architecture_library: '#architecture_library_destination',bic: '#bic_destination',chem_phys_library: '#chem_phys_library_destination',engineering_library: '#engineering_library_destination',kellogg_library: '#kellogg_library_destination',math_library: '#math_library_destination',radiation: '#radiation_destination',visual_resources: '#visual_resources_destination' });


     });









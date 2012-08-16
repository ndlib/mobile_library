
$(document).ready(function(){

    $('.labstat').each(function(index) {
        $(this).text(lookup($(this).attr("labid"), $(this).attr("labvar")));
    });
 });
 


$(document).ready(function(){
    $('#codfreight').change(function(event){
        event.preventDefault();
        $.ajax({
            url:  "/cart/freight",
            method: "post",
            data: $('#formfreight').serialize(),
            dataType: "html",
            beforeSend: function() {
                $("#loading-image").show();
            },
            success: function(result){
                $("#loading-image").hide();
                
            },
        })
    })
});
$(document).ready(function(){
    $("#aumentar").click(function () {
        var size = $(".container-fluid").css('font-size');
        $(".container-fluid").css('font-size',  parseInt(size) + 2)
        $("nav").css('font-size',  parseInt(size) + 2)
        $(".btn").css('font-size',  parseInt(size) + 2)

    });

    $("#diminuir").click(function () {
        var size = $(".container-fluid").css('font-size');
        $(".container-fluid").css('font-size',  parseInt(size) - 2)
        $("nav").css('font-size',  parseInt(size)  - 2)
        $(".btn").css('font-size',  parseInt(size)  - 2)
    });
});
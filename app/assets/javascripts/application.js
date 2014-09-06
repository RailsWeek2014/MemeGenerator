// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or vendor/assets/javascripts of plugins, if any, can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file.
//
// Read Sprockets README (https://github.com/sstephenson/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require jquery_ujs
//= require turbolinks
//= require_tree .

function setTemplate(id) {
    document.getElementById('meme_template_id').value = id;
    var elements = document.getElementsByClassName('selected');

    for (var i = 0; i < elements.length; i++) {
        elements[i].className = "";
    }
    var d = document.getElementById("templateimg" + id);
    d.className = "selected";
}

function showCharLen(id, maxchars) {
    var len = document.getElementById(id).value.length;
    var est = maxchars - len;
    if (est < 0) {
        est = 0;
    }
    $("#remaining_chars_" + id).empty();
    $("#remaining_chars_" + id).append(est); 
}
// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, or any plugin's
// vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file. JavaScript code in this file should be added after the last require_* statement.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery3
//= require jquery_ujs
//= require jquery.validate
//= require bootstrap-sprockets
//= require activestorage
//= require turbolinks
//= require_tree .

/* Toggle between adding and removing the "responsive" class to topnav when the user clicks on the icon */



function ValidateAlbumForm()
{

  $('#AlbumForm').validate({
    rules: {
      'album[title]': {required: true},
      'album[artist]': {required: true},

    },
    messages: {
      'album[title]': {required: "Title required."},
      'album[artist]': {required: "Artist required."},
    }
  });
}

function ValidateContactForm()
{
  $('#ContactForm').validate({
    rules: {
      name : {required: true},
      email : {required: true, email: true},

    },
    messages: {
      name : {required: "Contact name required"},
      email : { required: "Email required", email: "Email address must be in the format name@domain.com"},
    }
  });
}

function ValidateSongForm()
{
  $('#SongForm').validate({
    rules: {
      'song[title]': {required: true},
      'song[artist]': {required: true},

    },
    messages: {
      'song[title]': {required: "Title required",},
      'song[artist]': {required: "Artist required.",},
    }
  });
}

function SetFontSize(val){
  $("*").each(function(i,e){e.style.fontSize = val});
}

$(document).on('turbolinks:load',function() {
  if(document.getElementById('AlbumForm'))
  {
    ValidateAlbumForm();
  }
  if(document.getElementById('ContactForm'))
  {
    ValidateContactForm();

  }
  if(document.getElementById('SongForm'))
  {
    ValidateSongForm();
  }

});

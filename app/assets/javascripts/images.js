Dropzone.autoDiscover = false;
$(document).ready(function(){
  var dropzone = null;

  if ($('#image-upload').length) {
    dropzone = new Dropzone ("#image-upload", {
      dictRemoveFileConfirmation:  "Are you sure?",
      paramName: "image[file]",
      addRemoveLinks: true,
      url: "/images",
      headers: {
        'X-CSRF-Token': $('meta[name="csrf-token"]').attr('content')
      },
      success: function(file, response){
        updateImageCount();
      },
      removedfile: function (file) {
        updateImageCount();
        $(document).find(file.previewElement).remove();
      }
    });
  }

  function updateImageCount() {
    if(dropzone.files.length > 0) {
      $('.add-photos svg').addClass('image-active');
      $('.add-photos span').text("「" + dropzone.files.length + " 画像」");
    } else {
      $('.add-photos svg').removeClass('image-active');
      $('.add-photos span').text("");
    }
  }

  $('.btn-post-status').click(function (e) {
    e.preventDefault();
    dropzone.files.forEach(function(el,index,arr){
      var tmp = JSON.parse(el.xhr.response);
      var html = "<input name='post[image_ids][]' value='" + tmp.id + "'/>";
      $('.file').append($(html));
    });

    $('#new-post').submit();
  });

  $('.add-more-info').click(function () {
    $('.more-info').toggleClass("d-none");
    $('.add-more-info svg').addClass('image-active');
  });

  $('.btn-update-cover').click(function () {
    $('input.input-cover').trigger('click')
  });
  
  $("input.input-cover").change(function () {
    $('.update-cover').submit();
  });

  $('.avatar-update').click(function (e) {
    e.preventDefault();
    $('input.input-avatar').trigger('click')
  });

  $("input.input-avatar").change(function () {
    $('.update-avatar').submit();
  });

  $('.new-comment').keydown(function (e) {
    if(e.keyCode === 13) {
      $('.form-new-comment').submit();
    }
  });

  $('.btn-like').click(function (e) {
    e.preventDefault();
    $('.like-form').submit();
  });

  $('.btn-follow').click(function (e) {
    e.preventDefault();
    $('.follow-form').submit();
  });
});

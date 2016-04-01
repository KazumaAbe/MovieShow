$(function(){
  $('.image-upload-plus').click(function(){
    $document.getElementById('plus-button').innerHTML = "<div class='col-md-12'>
        <%= f.fields_for :thumbnails do |t| %>
        <div class='cover-image-upload' id='upload3'>
          <%= t.file_field :title, class: 'thumbnail-field', id: 'thumb-3' %>
        </div>
        <div class='thumb-image'>
          <%= t.hidden_field :status, value: 'sub' %>
        </div>
      </div>";
    $('.image-upload-plus span').remove;
  });
});

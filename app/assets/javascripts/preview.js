$(function(){
  $(.thumbnail-field).each(
    function(i){
      previewThumbnailsUploaded('#thumb-' + i);
  });
});

function previewThumbnailsUploaded(this){
  $(this).change(
    function() {
        if ( !this.files.length ) {
            return;
        }

        var file = $(this).prop('files')[0];
        var filereader = new FileReader();
        filereader.onload = function() {
            $('<img>').attr('src', filereader.result).css({
              'display': 'inline',
              'width': '100%',
              'height' : '100%',
              'text-align': 'center',
              'overflow': 'hidden'
            });
        }
        filereader.readAsDataURL(file);
    });
}

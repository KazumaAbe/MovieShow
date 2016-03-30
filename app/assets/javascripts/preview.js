$(function(){
  for (var i=0 ; i <= 3 ; i++){
    previewThumbnailsUploaded(i)
  }
});

function previewThumbnailsUploaded(number){
  $("input[type=file].thumb-" + number).change(
    function() {
        if ( !this.files.length ) {
            return;
        }

        var file = $(this).prop('files')[0];
        var filereader = new FileReader();
        fr.onload = function() {
            $('<img>').attr('src', filereader.result).css({
              'display': 'inline',
              'width': '100%',
              'height' : 'auto',
              'text-align': 'center',
              'overflow': 'hidden'
            });
        }
        fr.readAsDataURL(file);
    });
}

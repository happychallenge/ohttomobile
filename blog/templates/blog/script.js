<script type="text/javascript">
$(".btnMapMarker").click(function(){
    var post_id = $(this).attr("data-url");
    $.ajax({
        url : '/blog/popup_map/', // data-url : /blog/theme_add/
        type : 'get',
        data : { 'id': post_id },
        dataType: 'json',
        success: function(data) {
            console.log(data);
            var center = new google.maps.LatLng(data.lat, data.lng);
            console.log(center);

            var marker = new google.maps.Marker({
                map: map,
                position: center
            });

            $('#modal-postmap').modal({
                backdrop: 'static',
                keyboard: false
            }).on('shown.bs.modal', function () {
                google.maps.event.trigger(map, 'resize');
                map.setCenter(center);
            });
        }
    });
});


// Like and Cancel
$(document).on('click', '.like', function(){
  var pk = $(this).attr('data-url');
  console.log('PK : ' + pk);

  $.ajax({
    type: 'POST',
    url: "{% url 'blog:post_like' %}",
    data: {'pk': pk, 'csrfmiddlewaretoken': '{{csrf_token}}' },
    dataType: 'json',

    // response expression from Server 
    // { 'like_count': post.like_count, 'message': message }
    success: function(response){
      $("#lcount-"+pk).html(response.like_count);
    },

    error: function(request, status, error) {
        console.log(error);
        // alert("Have to login");
        // window.location.replace("/accounts/login/");
    },
  });
});

// Bucket
$(document).on('click', '.bucket', function(){
  var pk = $(this).attr('data-url');
  console.log('PK : ' + pk);

  $.ajax({
    type: 'POST',
    url: "{% url 'blog:post_bucket' %}",
    data: {'pk': pk, 'csrfmiddlewaretoken': '{{csrf_token}}' },
    dataType: 'json',

    // response expression from Server 
    // { 'like_count': post.like_count, 'message': message }
    success: function(response){
      alert(response.message);
      $("#bcount-"+pk).html(response.bucket_count);
    },

    error: function(request, status, error) {
        console.log(error);
        // alert("Have to login");
        // window.location.replace("/accounts/login/");
    },
  });
});

// .comment 버턴을 누르면 하단에 커멘트가 리스트로 나옴
$(document).on("click", ".comment", function(){

    var post = $(this).closest(".ibox");

    if ($(".comment_list", post).hasClass("tracking")) {
        $(".comment_list", post).slideUp();
        $(".comment_list", post).removeClass("tracking");

    } else {
        $(".comment_list", post).show();
        $(".comment_list", post).addClass("tracking");
        $(".comment_list input[name='content']", post).focus();

        var post_id = $(post).attr('post-id');
        // var post_id = 12;
        $.ajax({
            url: "{% url 'comment:post_comment' %}", 
            data: {'post_id': post_id },
            cache: false,
            beforeSend: function(){
                $("div.comment_list", post).html("<img src='/static/images/loading.gif'");
            },
            success: function(data){
                $("div.comment_list", post).html(data);
                $(".comment-count", post).text($(".commentCount", post).length)
            },
        });
        return false;
    }
});

// .comment 입력하고 Enter 키를 누르면 Comment가 입력이 됨
$(document).on("keydown", ".comment_list textarea[name='comment']", function(evt){

    var keyCode = evt.which?evt.which:evt.keyCode;
    var post = $(this).closest(".ibox");

    if (keyCode == 13) {
        var form = $(this).closest("form");
        var container = $(this).closest(".comment_list")
        var input = $(this);

        $.ajax({
            url: "{% url 'comment:post_comment' %}", 
            data: $(form).serialize(),
            type: "POST",
            cache: false,
            beforeSend: function(){
                $(input).val("");
            },
            success: function(data){
                $("div.comment_list", post).html(data);
                $(".comment-count", post).text($(".commentCount", post).length)
            },
        });
        return false;
    } 
});

</script>
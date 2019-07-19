// $(function() {
//   var search_list = $("#book-search-result");
//   var book_list = $(".selected-book")

//   function appendbook(item){
//   var html =` <div class="book_list_form" id="chat-user-8">
//               <p class="book_list_form__name">${item.volumeInfo.title}</p>
//               <div class="book_list_add"  data-book-id="${item.id}" data-book-title="${item.volumeInfo.title}">追加</div>
//               </div>`
//               search_list.append(html);
//   }

//   function appendBook_list(id,name){
//     var html=`<div class='form__select__book' >
//               <input name='video[book_id]' type='hidden' value='${id}'>
//               <p class='form__select__book__title'>${name}</p>
//               <div class='book-search-remove'>削除</div>
//               </div>`
//               book_list.append(html);
//   }


 
//   $(".book_search").on("click", function() {
//     var input = $(".book_text_field").val();
//     $(".form__select__book").remove()
//     $.ajax("https://www.googleapis.com/books/v1/volumes?q="+ input)
//     .done(function(data){
//       search_list.empty();
//       if (data.length !== 0) {
//         console.log(data)
//         console.log(data.items[0].volumeInfo.title)
//         items=data.items
//         console.log(items)
//         for (var i=0; i<4; i++){
//         // items.forEach(function(item ){
//           appendbook(items[i]);
//         // });
//         }
//       }
//       else {
//         search_list.empty();
//       }
//     })
      
//     .fail(function() {
//       alert('book検索に失敗しました');
//     })
//   })
//     $(document).on("click",".book_list_add ", function() {
//       var id =$(this).attr("data-book-id")
//       var name=$(this).attr("data-book-title")
//       appendBook_list(id,name)
//       $("#book-search-result").empty()
//     });
//     $(document).on("click",".book-search-remove", function() {
//       $(".form__select__book").remove()
//     });
// });

$(function() {
  var scroll_image = function(data){
    $(".owl-lazy-sub").css('opacity', 0.6);
    var id =$(data).attr("id")
    var pos = $("#"+id).position();
    $(data).css('opacity', 1);
    $('.item-photo_scroll').animate({
      scrollLeft: pos.left
    }, 300);
  } 
  $('.owl-lazy-sub').hover(function() {
    var data = this
    
    timeID =setTimeout(scroll_image,300,data);
   }, function() {
    clearTimeout(timeID)
  });
});




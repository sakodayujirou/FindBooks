$(function() {
  var search_list = $("#book-search-result");
  var book_list = $(".selected-book")

  function appendbook(book) {
  var html =` <div class="chat-group-user clearfix" id="chat-user-8">
              <p class="chat-group-user__name">${book.title}</p>
              <div class="user-search-add chat-group-user__btn chat-group-user__btn--add" data-book-id="${book.id}" data-book-title="${book.title}">追加</div>
              </div>`
              search_list.append(html);
  }

  function appendBook_list(id,name){
    var html=`<div class='form__select__book' >
              <input name='book_id' type='hidden' value='${id}'>
              <p class='chat-group-user__name'>${name}</p>
              <div class='user-search-remove chat-group-user__btn chat-group-user__btn--remove js-remove-btn'>削除</div>
              </div>`
              book_list.append(html);
  }


 
  $(".book_text_field").on("keyup", function() {
    var input = $(".book_text_field").val();
    $(".form__select__book").remove()
    $.ajax({
      type: 'GET',
      url: "/books",
      data: { keyword: input },
      dataType: 'json'
    })
  
    .done(function(books){
      search_list.empty();
      if (books.length !== 0) {
        books.forEach(function(book){
          appendbook(book);
        });
      }
      else {
        search_list.empty();
      }
    })
      
    .fail(function() {
      alert('book検索に失敗しました');
    })
  })
    $(document).on("click",".user-search-add ", function() {
      var id =$(this).attr("data-book-id")
      var name=$(this).attr("data-book-title")
      appendBook_list(id,name)
      $("#book-search-result").empty()
    });
    $(document).on("click",".user-search-remove ", function() {
      $(".form__select__book").remove()
    });
});

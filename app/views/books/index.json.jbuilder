json.array! @books do |book|
  json.title  book.title 
  json.id    book.id
end
class BookSerializer < ApplicationSerializer
  attributes :title, :language_code, :num_pages
  link(:self) { book_path(object)}
  link(:authors) {authors_path(book_id: object.id)}
  has_many :authors
end

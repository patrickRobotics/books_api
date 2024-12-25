class BookSerializer < ApplicationSerializer
  cache key: 'book/v1', expires_in: 1.day # evry book obj will be cathced into "book/v1/{book.id}-#{book.updated_at} "
  attributes :title, :language_code, :num_pages
  has_many :authors
end

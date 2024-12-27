class BookSerializer
  include JSONAPI::Serializer
  attributes :title, :isbn, :language_code, :num_pages
  has_many :authors
end

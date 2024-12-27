class AuthorSerializer
  include JSONAPI::Serializer
  attribute :name

  # attribute :private_date, if: :is_owner?
  #
  # def is_owner?
  #   object.id == current_user.id
  # end
end

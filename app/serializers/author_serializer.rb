class AuthorSerializer < ApplicationSerializer
  attribute :name, key: :full_name
  attributes :foo, :bar
  def foo
    'test'
  end

  def bar
    12345
  end

  # attribute :private_date, if: :is_owner?
  #
  # def is_owner?
  #   object.id == current_user.id
  # end
end

class Book < ApplicationRecord
  def self.ransackable_attributes(auth_object = nil)
    ['title', 'author_name']
  end
  def self.ransackable_associations(auth_object = nil)
    ['authors']
  end
  has_and_belongs_to_many :authors
end

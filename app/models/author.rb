class Author < ApplicationRecord
  def self.ransackable_attributes(auth_object = nil)
    ['name']
  end
  has_and_belongs_to_many :books
end

class Url < ApplicationRecord
  before_save {self.original_url = original_url.downcase}
  validates :original_url, presence: true
  validates :shortened_url, presence: true
end

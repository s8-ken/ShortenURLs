class Url < ApplicationRecord
  validate :add_error_sample
  
  before_save {self.original_url = original_url.downcase}
  validates :original_url, presence: true
  VALID_URL_REGEX = /\A(http|https):\/\/[\w]+\.[\w]+/
  validates :original_url, format: {with: VALID_URL_REGEX}
  validates :shortened_url, presence: true

end

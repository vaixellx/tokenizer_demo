class Invitation < ApplicationRecord
  include Tokenizer

  tokenize length: 10
  validates :email, presence: true
end

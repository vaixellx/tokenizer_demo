class Ticket < ApplicationRecord
  include Tokenizer

  tokenize :ref_code
  validates :email, presence: true
end

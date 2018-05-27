class LoginToken < ApplicationRecord
  include Tokenizer

  tokenize
end

module Tokenizer
  extend ActiveSupport::Concern

  TOKEN_FRAGMENTS = [
    ('A'..'Z').to_a - ['I', 'O'],
    (2..9).to_a
  ].flatten.freeze

  class_methods do
    def tokenize(column=:token, length: 6)
      @tokenize_column = column
      @tokenize_token_length = length

      before_create :generate_token
    end
  end

  private

  def tokenize_column
    self.class.instance_variable_get('@tokenize_column')
  end

  def tokenize_token_length
    self.class.instance_variable_get('@tokenize_token_length')
  end

  def generate_token
    self.send "#{tokenize_column}=", random_token
  end

  def random_token
    Array.new(tokenize_token_length) { TOKEN_FRAGMENTS.sample }.join
  end
end

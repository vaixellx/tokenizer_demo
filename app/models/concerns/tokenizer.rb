module Tokenizer
  extend ActiveSupport::Concern

  TOKEN_FRAGMENTS = [
    ('A'..'Z').to_a - ['I', 'O'],
    (2..9).to_a
  ].flatten.freeze

  class_methods do
    def tokenize(column=:token)
      @tokenize_column = column

      before_create :generate_token
    end
  end

  private

  def tokenize_column
    self.class.instance_variable_get('@tokenize_column')
  end

  def generate_token
    self.send "#{tokenize_column}=", random_token
  end

  def random_token
    Array.new(6) { TOKEN_FRAGMENTS.sample }.join
  end
end

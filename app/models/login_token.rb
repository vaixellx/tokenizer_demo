class LoginToken < ApplicationRecord
  TOKEN_FRAGMENTS = [
    ('A'..'Z').to_a - ['I', 'O'],
    (2..9).to_a
  ].flatten.freeze

  before_create :generate_token

  private

  def generate_token
    self.token = random_token
  end

  def random_token
    Array.new(6) { TOKEN_FRAGMENTS.sample }.join
  end
end

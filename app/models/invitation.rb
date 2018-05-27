class Invitation < ApplicationRecord
  TOKEN_FRAGMENTS = [
    ('A'..'Z').to_a - ['I', 'O'],
    (2..9).to_a
  ].flatten.freeze

  validates :email, presence: true
  before_create :generate_token

  private

  def generate_token
    self.ref_code = random_token
  end

  def random_token
    Array.new(10) { TOKEN_FRAGMENTS.sample }.join
  end
end

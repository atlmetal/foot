class User < ApplicationRecord
  has_many :players
  has_many :clubs
  has_many :federations
  validates :email, presence:true
  validates :name, presence:true
  validates :auth_token, presence:true

  after_initialize :generate_auth_token

  def generate_auth_token
    # User.new
    unless auth_token.present?
      #generate token
      self.auth_token = TokenGenerationService.generate
    end
  end
end

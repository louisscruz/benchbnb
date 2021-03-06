class User < ApplicationRecord
  after_initialize :ensure_session_token
  validates :username, :password_digest, :session_token, presence: true
  validates :username, :password_digest, :session_token, uniqueness: true
  validates :password, length: { minimum: 6, allow_nil: true }

  def self.generate_session_token
    begin
      token = SecureRandom::urlsafe_base64
    end while User.exists?(session_token: token)
    token
  end

  def self.find_by_credentials(username, password)
    user = User.find_by(username: username)
    user && user.is_password?(password) ? user: nil
  end

  attr_reader :password

  def is_password?(password)
    bc_object = BCrypt::Password.new(self.password_digest)
    bc_object.is_password?(password)
  end

  def password=(password)
    @password = password
    self.password_digest = BCrypt::Password.create(password)
  end

  def ensure_session_token
    self.session_token ||= self.class.generate_session_token
  end

  def reset_session_token!
    self.session_token = self.class.generate_session_token
    self.save!
    self.session_token
  end
end

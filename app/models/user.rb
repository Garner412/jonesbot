class User < ActiveRecord::Base
  include BCrypt
  has_many :attempts
  has_many :attempted_games , { through: :attempts, source: :game }
  # Remember to create a migration!

  validates :username, :email, {
                                 presence: true,
                               uniqueness: true
                               }

  validate :password_check


  def self.authenticate(username, password)
    @user = User.find_by_username(username)
    if @user && @user.password == password
      @user
    end
  end

  def password
    @password ||= Password.new(hashed_password)
  end

  def password=(new_password)
    @plaintext_password = new_password
    @password = Password.create(new_password)
    self.hashed_password = @password
  end

  def completed_games
    Attempt.where('user_id = ? AND solveds = ?',self.id, true).map {|attempt| attempt.game}
  end

  private
  def password_check
    if @plaintext_password && @plaintext_password.length < 8
      errors.add(:password, "Password must be at least 8 characters")
    end
  end
end

  
class User < ActiveRecord::Base

  has_secure_password 
  
  validates :email, uniqueness: { case_sensitive: false }, presence: true
  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :password, presence: true, confirmation: true, length: { minimum: 6 }

  before_validation :strip_whitespace
  
  before_save :downcase_email

  private

  def self.authenticate_with_credentials(email, password) 
    @user = User.find_by(email: email.downcase)
    if @user && @user.authenticate(password)
      @user
    else
      nil
    end
  end

  def strip_whitespace
    self.email = self.email.strip unless self.email.nil?
  end

  def downcase_email
    self.email = self.email.downcase
  end

end
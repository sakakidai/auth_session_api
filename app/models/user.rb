class User < ApplicationRecord
  has_secure_password
  before_validation :downcase_email

  validates :name, presence: true, length: { maximum: 30, allow_blank: true }
  validates :email, presence: true, uniqueness: true, email: { allow_blank: true }
  # 新規作成時のパスワードのnilチェックはbcryptに任せる
  validates :password, presence: true, length: { minimum: 8, allow_blank: true }, allow_nil: true

  private

  def downcase_email
    if email
      self.email.downcase! 
    end
  end
end

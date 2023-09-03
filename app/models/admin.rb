class Admin < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable,
         :recoverable, :rememberable, :validatable

  enum role: {
    super_admin: 'super_admin',
    admin: 'admin',
    moderator: 'moderator'
  }

end

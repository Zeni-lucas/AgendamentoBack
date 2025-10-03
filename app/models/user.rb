class User < ApplicationRecord
    enum role: { client: 0, professional: 1, admin: 2 }
    enum status: { active: 0, inactive: 1  }

    validates :name,presence: true
    validates :email, presence: true, uniqueness: true
    validates :document, presence: true, uniqueness: true
    validates :password, presence: true
end

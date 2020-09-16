class User < ApplicationRecord
  validates :name, presence: true
  validates :email, presence: true

  def titulo_completo
    "#{self.name} Email: #{self.email}"
  end
end

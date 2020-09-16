class User < ApplicationRecord
  # validates :name, presence: true

  def isEmpty
    self.name.blank?
  end

  def reverseString
    self.name == nil ? nil : self.name.reverse
  end
end

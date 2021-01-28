class Extract < ApplicationRecord
  default_scope { order(id: :desc) }
  
  belongs_to :user
end

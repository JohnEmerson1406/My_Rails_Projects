class Extract < ApplicationRecord
  default_scope { order(id: :desc) }
  
  belongs_to :user

  enum kind: { input: 0, output: 1 }
end

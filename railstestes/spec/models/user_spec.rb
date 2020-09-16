require 'rails_helper'

RSpec.describe User, type: :model do
  context "Validade de um Usuário" do
    it "Usuário válido" do
      user = User.new
      user.name = "John"
      user.email = "john@john.com"

      expect(user.valid?).to be_truthy 
    end

    it "Usuário inválido" do
      user = User.new
      user.name = "John"
      user.email = nil

      expect(user.valid?).to be_falsey
    end
  end

  context "Títulos válidos" do
    it "Título completo" do
      user = User.new
      user.name = "John"
      user.email = "john@john.com"

      expect(user.titulo_completo).to eql("Sr. John - Email: john@john.com") 
    end
  end
  
end

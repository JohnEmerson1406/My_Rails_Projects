require 'rails_helper'

RSpec.describe User, type: :model do
  context "Teste IsEmpty" do
    it "String válida" do
      user = User.new
      user.name = "John"
      expect(user.isEmpty).to be_falsey
    end

    it "String nula" do
      user = User.new
      user.name = nil
      expect(user.isEmpty).to be_truthy
    end

    it "String vazia" do
      user = User.new
      user.name = ""
      expect(user.isEmpty).to be_truthy
    end
  end

  context "Teste Reverse" do
    it "Reverse válido" do
      user = User.new
      user.name = "John"
      expect(user.reverseString).to eql("John")
    end

    it "Reverse nulo" do
      user = User.new
      user.name = nil
      expect(user.reverseString).to be_nil
    end
  end
  
end

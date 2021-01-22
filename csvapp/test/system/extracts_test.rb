require "application_system_test_case"

class ExtractsTest < ApplicationSystemTestCase
  setup do
    @extract = extracts(:one)
  end

  test "visiting the index" do
    visit extracts_url
    assert_selector "h1", text: "Extracts"
  end

  test "creating a Extract" do
    visit extracts_url
    click_on "New Extract"

    fill_in "Kind", with: @extract.kind
    fill_in "Movement", with: @extract.movement
    fill_in "Value", with: @extract.value
    click_on "Create Extract"

    assert_text "Extract was successfully created"
    click_on "Back"
  end

  test "updating a Extract" do
    visit extracts_url
    click_on "Edit", match: :first

    fill_in "Kind", with: @extract.kind
    fill_in "Movement", with: @extract.movement
    fill_in "Value", with: @extract.value
    click_on "Update Extract"

    assert_text "Extract was successfully updated"
    click_on "Back"
  end

  test "destroying a Extract" do
    visit extracts_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Extract was successfully destroyed"
  end
end

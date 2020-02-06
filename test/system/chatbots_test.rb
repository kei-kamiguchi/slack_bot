require "application_system_test_case"

class ChatbotsTest < ApplicationSystemTestCase
  setup do
    @chatbot = chatbots(:one)
  end

  test "visiting the index" do
    visit chatbots_url
    assert_selector "h1", text: "Chatbots"
  end

  test "creating a Chatbot" do
    visit chatbots_url
    click_on "New Chatbot"

    fill_in "Message", with: @chatbot.message
    fill_in "Name", with: @chatbot.name
    click_on "Create Chatbot"

    assert_text "Chatbot was successfully created"
    click_on "Back"
  end

  test "updating a Chatbot" do
    visit chatbots_url
    click_on "Edit", match: :first

    fill_in "Message", with: @chatbot.message
    fill_in "Name", with: @chatbot.name
    click_on "Update Chatbot"

    assert_text "Chatbot was successfully updated"
    click_on "Back"
  end

  test "destroying a Chatbot" do
    visit chatbots_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Chatbot was successfully destroyed"
  end
end

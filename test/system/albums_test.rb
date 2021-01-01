require "application_system_test_case"

class AlbumsTest < ApplicationSystemTestCase
  setup do
    @album = albums(:one)
  end

  test "visiting the index" do
    visit albums_url
    assert_selector "h1", text: "Albums"
  end

  test "creating a Albums" do
    visit albums_url
    click_on "New Albums"

    fill_in "Image", with: @album.image
    fill_in "Title", with: @album.title
    fill_in "User", with: @album.user_id
    click_on "Create Albums"

    assert_text "Albums was successfully created"
    click_on "Back"
  end

  test "updating a Albums" do
    visit albums_url
    click_on "Edit", match: :first

    fill_in "Image", with: @album.image
    fill_in "Title", with: @album.title
    fill_in "User", with: @album.user_id
    click_on "Update Albums"

    assert_text "Albums was successfully updated"
    click_on "Back"
  end

  test "destroying a Albums" do
    visit albums_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Albums was successfully destroyed"
  end
end

feature 'Adding bookmarks' do
  scenario 'A user can add bookmarks' do
    connection = PG.connect(dbname: 'bookmark_manager_test')

    visit('/add_bookmarks')
    fill_in "new_url", with: "https://github.com/rubocop-hq/rspec-style-guide/issues/6"
    click_button("Submit")
    visit('/bookmarks')
    expect(page).to have_content "https://github.com/rubocop-hq/rspec-style-guide/issues/6"

  end
end

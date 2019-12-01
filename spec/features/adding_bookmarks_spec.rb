feature 'Adding bookmarks' do
  scenario 'A user can add bookmarks' do
    #connection = PG.connect(dbname: 'bookmark_manager_test')

    visit('/add_bookmarks')
    fill_in "url", with: "https://en.wikipedia.org/wiki/Apulia"
    fill_in("title", with: 'Apulia')
    click_button("Submit")
    visit('/bookmarks')
    expect(page).to have_link('Apulia', href: 'https://en.wikipedia.org/wiki/Apulia')


    #expect(page).to have_content "https://en.wikipedia.org/wiki/Apulia"

  end
end

# Typing a URL into a form on that page
# Submitting the form
# Seeing the bookmark they just submitted.

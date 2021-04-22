feature 'Bookmarks' do
  scenario 'shows a list of bookmarks' do
    connection = PG.connect(dbname: 'bookmark_manager_test')

    # Add the test data
    connection.exec("INSERT INTO bookmarks (title, url) VALUES ('Makers', 'http://www.makersacademy.com');")

    visit '/'
    click_button 'Bookmarks'
    expect(page).to have_link('Makers', href: 'http://www.makersacademy.com')
  end

  scenario 'add bookmark' do
    visit '/'
    click_button 'Add Bookmark'
    fill_in 'Title', with: 'Test Site'
    fill_in 'URL', with: 'http://test_site.com'
    click_button 'Submit'
    click_button 'Bookmarks'
    expect(page).to have_link('Test Site', href: 'http://test_site.com')
  end
end

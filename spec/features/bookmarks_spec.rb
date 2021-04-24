feature 'Bookmarks' do
  scenario 'shows a list of bookmarks' do
    connection = PG.connect(dbname: 'bookmark_manager_test')
    # Add the test data
    connection.exec("INSERT INTO bookmarks (title, url) VALUES ('Makers', 'http://www.makersacademy.com');")

    visit '/'
    click_button 'Bookmarks'
    expect(page).to have_current_path('/bookmarks')
    expect(page).to have_link('Makers', href: 'http://www.makersacademy.com')
  end

  scenario 'add bookmark' do
    visit '/'
    click_button 'Add Bookmark'
    fill_in 'Title', with: 'Test Site'
    fill_in 'URL', with: 'http://test_site.com'
    click_button 'Submit'
    click_button 'Bookmarks'
    expect(page).to have_current_path('/bookmarks')
    expect(page).to have_link('Test Site', href: 'http://test_site.com')
  end

  scenario 'delete bookmark' do
    connection = PG.connect(dbname: 'bookmark_manager_test')
    # Add the test data
    connection.exec("INSERT INTO bookmarks (title, url) VALUES ('Makers', 'http://www.makersacademy.com');")

    visit '/'
    click_button 'Bookmarks'
    click_button 'Makers-delete'
    expect(page).to have_current_path('/bookmarks')
    expect(page).not_to have_link('Makers', href: 'http://www.makersacademy.com')
  end

  scenario 'update bookmark title' do
    connection = PG.connect(dbname: 'bookmark_manager_test')
    # Add the test data
    connection.exec("INSERT INTO bookmarks (title, url) VALUES ('Google', 'http://www.google.com');")
    connection.exec("INSERT INTO bookmarks (title, url) VALUES ('BBC', 'http://www.bbc.co.uk');")

    visit '/'
    click_button 'Bookmarks'
    click_button 'Google-update'
    fill_in 'Title', with: 'Not Google'
    click_button 'Submit'
    expect(page).to have_current_path('/bookmarks')
    expect(page).to have_link('Not Google', href: 'http://www.google.com')
    expect(page).to have_link('BBC', href: 'http://www.bbc.co.uk')
  end

  scenario 'update bookmark url' do
    connection = PG.connect(dbname: 'bookmark_manager_test')
    # Add the test data
    connection.exec("INSERT INTO bookmarks (title, url) VALUES ('Google', 'http://www.google.com');")
    connection.exec("INSERT INTO bookmarks (title, url) VALUES ('BBC', 'http://www.bbc.co.uk');")

    visit '/'
    click_button 'Bookmarks'
    click_button 'Google-update'
    fill_in 'url', with: 'http://www.yahoo.com'
    click_button 'Submit'
    expect(page).to have_current_path('/bookmarks')
    expect(page).to have_link('Google', href: 'http://www.yahoo.com')
    expect(page).to have_link('BBC', href: 'http://www.bbc.co.uk')
  end
end

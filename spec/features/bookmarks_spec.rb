feature 'Display Bookmarks' do
  scenario 'shows a list of bookmarks' do
    visit '/'
    click_button 'Bookmarks'
    expect(page).to have_link('Makers', href: 'http://makers.tech')
  end
end

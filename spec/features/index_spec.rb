feature 'Index' do
  scenario 'Shows title' do
    visit '/'
    expect(page).to have_content('Bookmark Manager')
  end
end

require 'pg'


feature 'Viewing venues' do
  scenario 'A user can see venues' do
    connection = PG.connect(dbname: 'makersbnb_test')
    # Add the test data
    connection.exec("INSERT INTO venues VALUES(1, 1, 'Penthouse', '4 bed overlooking the Thames', 1000.00);")
    connection.exec("INSERT INTO venues VALUES(2, 2, 'Villa', '3 bed with pool', 500.00);")
    connection.exec("INSERT INTO venues VALUES(3, 3, 'Chalet', '5 bed with fireplace', 750.50);")
    visit('/')

    expect(page).to have_content "Penthouse"
    expect(page).to have_content "Villa"
    expect(page).to have_content "Chalet"
  end
end

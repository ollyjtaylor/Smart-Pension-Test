require 'app'

describe 'parse_most_pages' do
  it 'should return a hash' do
    expect(parse_most_pages('lib/webserver.log')).to be_a Hash
  end

  it 'should order most page visits from highest to lowest' do
    most_visited = parse_most_pages('lib/webserver.log').first

    expect(most_visited).to eq(['/about/2', 90])
  end
end

describe 'parse_most_unique' do
  it 'should return a hash' do
    expect(parse_most_unique('lib/webserver.log')).to be_a Hash
  end

  it 'should return most unique page visits from highest to lowest' do
    most_unique_visited = parse_most_unique('lib/webserver.log').first

    expect(most_unique_visited).to eq(['/help_page/1', 23])
  end
end

require 'rails_helper'

describe 'when user visits index page' do
  it 'shows list of all trip names' do
    trip = Trip.create(name: 'Pigeon')

    visit trips_path

    expect(page).to have_content(trip.name)
  end

  it 'can click single trip to see show page' do
    trip1 = Trip.create(name: 'Pigeon')
    trip2 = Trip.create(name: 'Hawk')

    visit trips_path

    click_link "#{trip1.name}"

    expect(current_path).to eq(trip_path(trip1))
    expect(page).to have_content(trip1.name)
    expect(page).to_not have_content(trip2.name)
  end
end

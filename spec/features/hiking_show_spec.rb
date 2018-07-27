require 'rails_helper'

describe 'when user visits show page' do
  it 'shows list of all trails for given trip' do
    trip = Trip.create(name: 'Pigeon')
    trail1 = trip.trails.create(length: 1, name: 'Turtle', address: 'CO')
    trail2 = trip.trails.create(length: 2, name: 'Possum', address: 'CO')

    visit trip_path(trip)

    expect(page).to have_content(trail1.length)
    expect(page).to have_content(trail1.name)
    expect(page).to have_content(trail1.address)
    expect(page).to have_content(trail2.length)
    expect(page).to have_content(trail2.name)
    expect(page).to have_content(trail2.address)
  end

  xit 'can click single trip to see show page' do
    trip1 = Trip.create(name: 'Pigeon')
    trip2 = Trip.create(name: 'Hawk')
  end
end

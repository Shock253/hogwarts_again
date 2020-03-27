require 'rails_helper'


RSpec.describe "As a visitor", type: :feature do
  context "When I visit /professors" do
    it "I see a list of professors with their information" do

      snape = Professor.create(name: "Severus Snape", age: 45, specialty: "Potions")
      hagrid = Professor.create(name: "Rubeus Hagrid", age: 38 , specialty: "Care of Magical Creatures")
      lupin = Professor.create(name: "Remus Lupin", age: 49 , specialty: "Defense Against The Dark Arts")

      visit "/professors"

      within "professor-#{snape.id}" do
        expect(page).to have_content("Severus Snape")
        expect(page).to have_content(45)
        expect(page).to have_content("Potions")
      end

      within "professor-#{hagrid.id}" do
        expect(page).to have_content("Rubeus Hagrid")
        expect(page).to have_content(38)
        expect(page).to have_content("Care of Magical Creatures")
      end

      within "professor-#{lupin.id}" do
        expect(page).to have_content("Remus Lupin")
        expect(page).to have_content(49)
        expect(page).to have_content("Defense Against The Dark Arts")
      end
    end
  end
end






# User Story 1 of 4
# As a visitor,
# When I visit '/professors',
# I see a list of professors with the following expect(page).to have_content(# -Name)
# -Age
# -Specialty
# (e.g. "Name: Minerva McGonagall, Age: 204, Specialty: Transfiguration")

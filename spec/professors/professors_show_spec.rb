require 'rails_helper'


RSpec.describe "As a visitor", type: :feature do
  context "When I visit /professors/:id" do
    it "I see a list of that professor's students" do

      snape = Professor.create(name: "Severus Snape", age: 45, specialty: "Potions")
      hagrid = Professor.create(name: "Rubeus Hagrid", age: 38 , specialty: "Care of Magical Creatures")
      lupin = Professor.create(name: "Remus Lupin", age: 49 , specialty: "Defense Against The Dark Arts")

      harry = Student.create(name: "Harry Potter" , age: 11 , house: "Gryffindor")
      malfoy = Student.create(name: "Draco Malfoy" , age: 12 , house: "Slytherin")
      longbottom = Student.create(name: "Neville Longbottom" , age: 11 , house: "Gryffindor" )

      ProfessorStudent.create(student: harry, professor: snape)
      ProfessorStudent.create(student: harry, professor: hagrid)
      ProfessorStudent.create(student: harry, professor: lupin)
      ProfessorStudent.create(student: malfoy, professor: hagrid)
      ProfessorStudent.create(student: malfoy, professor: lupin)
      ProfessorStudent.create(student: longbottom, professor: snape)

      visit "/professors/#{snape.id}"

      expect(page).to have_content("Harry Potter")
      expect(page).to have_content("Neville Longbottom")


    end

    it "I can see the average age of all that professor's students" do

      snape = Professor.create(name: "Severus Snape", age: 45, specialty: "Potions")
      hagrid = Professor.create(name: "Rubeus Hagrid", age: 38 , specialty: "Care of Magical Creatures")
      lupin = Professor.create(name: "Remus Lupin", age: 49 , specialty: "Defense Against The Dark Arts")

      harry = Student.create(name: "Harry Potter" , age: 11 , house: "Gryffindor")
      malfoy = Student.create(name: "Draco Malfoy" , age: 12 , house: "Slytherin")
      longbottom = Student.create(name: "Neville Longbottom" , age: 11 , house: "Gryffindor" )

      ProfessorStudent.create(student: harry, professor: snape)
      ProfessorStudent.create(student: harry, professor: hagrid)
      ProfessorStudent.create(student: harry, professor: lupin)
      ProfessorStudent.create(student: malfoy, professor: hagrid)
      ProfessorStudent.create(student: malfoy, professor: lupin)
      ProfessorStudent.create(student: longbottom, professor: snape)

      visit "/professors/#{hagrid.id}"

      expect(page).to have_content("Average age: #{(harry.age.to_f + malfoy.age.to_f)/2}")
    end
  end
end

# User Story 2 of 4
# As a visitor,
# When I visit '/professors/:id'
# I see a list of the names of the students the professors have.
# (e.g. "Neville Longbottom"
#       "Hermione Granger"
#       "Luna Lovegood")

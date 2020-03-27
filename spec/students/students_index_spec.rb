require 'rails_helper'


RSpec.describe "As a visitor", type: :feature do
  context "When I visit /students" do
    it "I see a list of students with their information" do
      snape = Professor.create(name: "Severus Snape", age: 45, specialty: "Potions")
      hagrid = Professor.create(name: "Rubeus Hagrid", age: 38 , specialty: "Care of Magical Creatures")
      lupin = Professor.create(name: "Remus Lupin", age: 49 , specialty: "Defense Against The Dark Arts")

      harry = Student.create(name: "Harry Potter" , age: 11 , house: "Gryffindor" )
      malfoy = Student.create(name: "Draco Malfoy" , age: 12 , house: "Slytherin" )
      longbottom = Student.create(name: "Neville Longbottom" , age: 11 , house: "Gryffindor" )

      ProfessorStudent.create(student: harry, professor: snape)
      ProfessorStudent.create(student: harry, professor: hagrid)
      ProfessorStudent.create(student: harry, professor: lupin)
      ProfessorStudent.create(student: malfoy, professor: hagrid)
      ProfessorStudent.create(student: malfoy, professor: lupin)
      ProfessorStudent.create(student: longbottom, professor: snape)

      visit "/students"

      within "#student-#{harry.id}" do
        expect(page).to have_content("#{harry.name}: #{harry.professor_students.length}")
      end

      within "#student-#{malfoy.id}" do
        expect(page).to have_content("#{malfoy.name}: #{malfoy.professor_students.length}")
      end

      within "#student-#{longbottom.id}" do
        expect(page).to have_content("#{longbottom.name}: #{longbottom.professor_students.length}")
      end
    end
  end
end

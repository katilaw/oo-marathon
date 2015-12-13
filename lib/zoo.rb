class Zoo
  attr_reader :name, :season_opening_date, :season_closing_date, :cages, :employees
  def initialize(name,season_opening_date,season_closing_date, given_cage=10)
    @name = name
    @season_opening_date = season_opening_date
    @season_closing_date = season_closing_date
    @cages = []
    given_cage.times do
      cages << Cage.new
    end
    @employees = []
  end

  def add_employee(name)
    @employees << name
  end

  def open?(date)
    date >= season_opening_date && date <= season_closing_date
  end

  def add_animal(new_animal)
    cages.each do |cage|
      if cage.empty?
        cage.animal=new_animal
        return
      end
    end
    raise ZooAtCapacity
  end

  def ZooAtCapacity
  end

  def visit
    string = ""
    employees.each do |employee|
      string += employee.greet+"\n"
    end
    cages.each do |cage|
      unless cage.empty?
        string += cage.animal.speak+"\n"
      end
    end
    string
  end
end

class ZooAtCapacity < StandardError
end

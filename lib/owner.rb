require 'pry'
class Owner
  attr_reader :name, :species
  
  @@all = []
  
  def initialize(name)
    @name = name
    @species = "human"
    @@all << self
  end
  
  def say_species
    "I am a #{@species}."
  end
  
  def self.all
    @@all
  end
  
  def self.count
    @@all.length
  end
  
  def self.reset_all
    @@all.clear
  end
  
  def cats
    your_cats = []
    if Cat.all.count != 0 
      Cat.all.each do |cat| 
        if cat.owner != nil && cat.owner.name == self.name
          your_cats << cat
        end
      end
      your_cats
    else
      your_cats
    end
  end
  
  def dogs
    your_dogs = []
    if Dog.all.count != 0 
      Dog.all.each do |dog| 
        if dog.owner != nil && dog.owner.name == self.name
          your_dogs << dog
        end
      end
      your_dogs
    else
      your_dogs
    end
  end
  
  def buy_cat(name)
    cat = Cat.new(name)
    cat.owner = self
  end
  
  def buy_dog(name)
    dog = Dog.new(name)
    dog.owner = self
  end
  
  def walk_dogs
    self.dogs.each do |dog|
      dog.mood = "happy"
    end
  end
  
  def feed_cats
    self.cats.each do |cat|
      cat.mood = "happy"
    end
  end
  
  def sell_pets
    self.cats.each do |cat|
      cat.mood = "nervous"
      cat.owner = nil
    end
    
    self.dogs.each do |dog|
      dog.mood = "nervous"
      dog.owner = nil
    end
  end
  
  def list_pets
    "I have #{self.dogs.count} dog(s), and #{self.cats.count} cat(s)."
  end
end
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
    if Cat.all.count != 0 
      your_cats = Cat.all.collect{|cat| cat.owner.name == self.name}
      your_cats
    else
      []
    end
  end
  
  def dogs
    if Dog.all.count != 0 
      your_dogs = Dog.all.collect{|dog| dog.owner.name == self.name}
      your_dogs
    else
      []
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
    puts "I have #{self.dogs.count} dog(s) and #{self.cats.count} cat(s)."
  end
end
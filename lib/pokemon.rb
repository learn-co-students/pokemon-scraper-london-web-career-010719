require 'pry'

class Pokemon

  @@all = []

  attr_accessor :id, :name, :type, :db, :hp

def initialize(id:, name:, type:, db:)
  @name=name
  @type=type
  @id = id
  @db = db
  @@all << self
end

def self.all
  @@all
end

def self.save (name, type, db)
db.execute("INSERT INTO Pokemon(name, type) VALUES (?,?)", name, type)
end

def self.find (id, db)
  pokemon = db.execute("SELECT * FROM Pokemon WHERE id = ?", id).flatten
  # binding.pry
  Pokemon.new(id: pokemon[0], name: pokemon[1], type: pokemon[2], db: db)
end

def hp
db.execute("SELECT hp FROM pokemon WHERE id = ?", self.id).flatten.first
end

def alter_hp(hp, db)
db.execute("UPDATE Pokemon SET hp = ? WHERE id = ?", hp, self.id)
end




  #class end
end

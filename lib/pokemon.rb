require 'pry'

class Pokemon

  @@all = []

  attr_accessor :id, :name, :type, :db, :hp

  def initialize(id:, name:, type:, db:)
    @id = id
    @name = name
    @type = type
    @db = db
    @@all << self
  end

  def self.all
    @@all
  end

  def self.save(name, type, db)
    db.execute("INSERT INTO pokemon (name, type) VALUES (?, ?)", name, type)
  end

  def self.find(id, db)
    name, type = db.execute("SELECT name, type FROM pokemon WHERE id = (?)", id).flatten
    Pokemon.new(id: id, name: name, type: type, db: db)
  end
  
end

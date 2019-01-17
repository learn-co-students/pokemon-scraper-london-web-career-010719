class Pokemon
  attr_accessor :id, :name, :type, :db

  @@all = []

  def initialize (id:, name:, type:, db:)
    @id = id
    @name = name
    @type = type
    @db = db

    self.class.all << self
  end

  def self.all
    @@all
  end

  def alter_hp(amount, db)
    db.execute("UPDATE pokemon SET hp = ? WHERE id = ?", amount, self.id)
  end

  def hp
    self.db.execute("SELECT hp FROM pokemon WHERE id = ?", self.id).first[0]
  end

  def self.save(name, type, db)
    db.execute("INSERT INTO pokemon (name, type) VALUES (?, ?)", name, type)
  end

  def self.find(id, db)
    pokemon = db.execute("SELECT * FROM pokemon WHERE id = ?", id).first
    #if we find the pokemon create an object for it
    Pokemon.new(id: pokemon[0], name: pokemon[1], type: pokemon[2], db: db) if pokemon != []
  end
end

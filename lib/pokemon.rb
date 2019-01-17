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
    db.execute("UPDATE pokemon SET hp = ? WHERE id = ?", amount, id)
  end

  def hp
    db.execute("SELECT hp FROM pokemon WHERE id = ?", id).flatten[0]
  end

  def self.save(name, type, db)
    db.execute("INSERT INTO pokemon (name, type) VALUES (?, ?)", name, type)
  end

  def self.find(id, db)
    name, type = db.execute("SELECT * FROM pokemon WHERE id = ?", id).first
    Pokemon.new(id: id, name: name, type: type, db: db) if pokemon != []
  end
end

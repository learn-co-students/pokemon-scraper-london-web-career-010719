class Pokemon

  attr_accessor :id, :name, :type, :db, :hp
  @@all = []

  def initialize (id:, name:, hp:nil, type:, db:)
    @id = id
    @name = name
    @type = type
    @db = db
    @hp = hp
    @@all << self
  end

  def self.save (name, type, db_connection)
    db_connection.execute("INSERT INTO pokemon (name, type) VALUES (?,?)", name, type)
  end

  def self.find (id, db_connection)
    retrieved = db_connection.execute("SELECT * FROM pokemon WHERE id = ?", id).flatten
    name = retrieved[1]
    type = retrieved[2]
    hp = retrieved[3]
    new_pokemon = Pokemon.new(id:id, name:name, hp:hp, type:type, db:db_connection)
    new_pokemon
    #binding.pry
  end

  def alter_hp (hp, db_connection)
    db_connection.execute("UPDATE pokemon SET hp = ? WHERE id = ?", hp, self.id)
  end


end

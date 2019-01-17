class Pokemon

 attr_accessor :id, :name, :type, :db
  def initialize(id:, name:, type:, db:)
    @id = id
    @name = name
    @type = type
    @db = db


  end

  def self.save(name,type,db)
    db.execute("INSERT INTO pokemon (id,name,type)VALUES(?,?,?)",@id,name,type)
  end

  def self.find(id, db)
      new_pokemon = db.execute("SELECT * FROM pokemon WHERE pokemon.id =?", id).flatten
      Pokemon.new(id:new_pokemon[0],name:new_pokemon[1],type:new_pokemon[2],db:db)

  end

  def alter_hp(new_hp,db)
    db.execute("UPDATE pokemon SET hp = ? WHERE id = ?",new_hp, self.id)

  end

  def hp
      show_hp = db.execute("SELECT hp FROM pokemon WHERE id = ?", self.id).flatten
      show_hp[0]
  end

end

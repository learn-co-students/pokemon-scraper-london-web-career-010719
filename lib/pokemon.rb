require 'pry'

class Pokemon

    attr_accessor  :id, :name, :type, :db, :hp
    @@all = []

    def initialize(id:, name:, type:, db:, hp: nil)
        @id = id
        @name = name
        @type = type
        @db = db
        @hp = hp
    end


    def self.save(name, type, db)
        sql = <<-SQL
        INSERT INTO pokemon (name, type)
        VALUES (?, ?);
        SQL
        db.execute(sql, name, type)
    end


    def self.find(id, db)
        sql = <<-SQL
        SELECT * FROM pokemon
        WHERE id = ?
        SQL
        info = db.execute(sql, id).flatten!
        Pokemon.new(id: info[0], name: info[1], type: info[2], hp: info[3], db: db)
    end

    def alter_hp(new_hp, db)
        db.execute("UPDATE pokemon SET hp = ? WHERE id = ?", new_hp, self.id)
        
    end

    

end

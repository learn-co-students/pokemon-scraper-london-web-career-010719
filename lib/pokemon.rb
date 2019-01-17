class Pokemon

    attr_accessor :id, :name, :type, :db

    @@all = []

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
        db.execute("INSERT INTO Pokemon(name, type)
        VALUES (?, ?)",name, type)
      end

      def self.find(id, db)
        pokemon = db.execute("SELECT * FROM Pokemon WHERE id = ?", id)[0]
        Pokemon.new(id: pokemon[0], name: pokemon[1], type:pokemon[2], db: db)
      end

    def alter_hp(hp, db)
      x = db.execute("UPDATE Pokemon SET hp = ? WHERE id = ?", hp, self.id)
    end

    def hp
    db.execute("SELECT hp FROM pokemon WHERE id = ?", self.id)[0][0]
    end


  end

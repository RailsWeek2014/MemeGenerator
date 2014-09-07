class Meme < ActiveRecord::Base
    attr_accessor :textoben
    attr_accessor :textunten
    attr_accessor :template_id
    validates :title, length: { in: 1..100 }
    validates :description, length: { in: 1..200 }
    validates :textoben, length: { in: 1..120 }
    validates :textunten, length: { in: 1..120 }
    validates :template_id, length: { in: 1..5 }

    belongs_to :user

end
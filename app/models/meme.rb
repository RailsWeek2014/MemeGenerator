class Meme < ActiveRecord::Base

    acts_as_commentable
    acts_as_likeable
    acts_as_taggable
    acts_as_taggable_on :tags

    attr_accessor :textoben
    attr_accessor :textunten
    attr_accessor :template_id
    attr_accessor :comment
    attr_accessor :tag_list
    validates :title, length: { in: 1..100 }
    validates :description, length: { in: 1..200 }
    validates :textoben, length: { in: 1..120 }
    validates :textunten, length: { in: 1..120 }
    validates :template_id, length: { in: 1..5 }

    belongs_to :user

end
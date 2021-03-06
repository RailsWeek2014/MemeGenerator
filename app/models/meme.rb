class Meme < ActiveRecord::Base

    acts_as_commentable
    acts_as_likeable
    acts_as_taggable_on :tags

    attr_accessor :text_up
    attr_accessor :text_down
    attr_accessor :template_id
    attr_accessor :comment
    validates :title, length: { in: 1..50, :message => "Der Titel muss zwischen 1 und 50 Zeichen lang sein" }
    validates :description, length: { maximum: 200, :message => "Die Beschreibung darf nicht länger als 200 Zeichen sein" }
    validates :text_up, length: { in: 1..120, :message => "Der obere Text für das Meme muss zwischen 1 und 120 Zeichen lang sein" }
    validates :text_down, length: { in: 1..120, :message => "Der untere Text für das Meme muss zwischen 1 und 120 Zeichen lang sein" }
    validates :template_id, length: { in: 1..5, :message => "Es muss ein Template ausgewählt werden" }
    validates :tag_list, length: { maximum: 120, :message => "Die Tags dürfen 120 Zeichen nicht überschreiten" }

    belongs_to :user

end
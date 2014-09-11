class MemeTemplate < ActiveRecord::Base
    mount_uploader :template_img, TemplateUploader
    validates_presence_of :template_img
    validates_integrity_of :template_img
    validates_processing_of :template_img
    validates :title, length: { in: 1..100, :message => "Der Titel muss zwischen 1 und 100 Zeichen lang sein" }

    belongs_to :user

end
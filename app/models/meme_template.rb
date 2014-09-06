class MemeTemplate < ActiveRecord::Base
    mount_uploader :template_img, TemplateUploader
    validates_presence_of :template_img
    validates_integrity_of :template_img
    validates_processing_of :template_img
    validates :title, length: { in: 1..100 }
end
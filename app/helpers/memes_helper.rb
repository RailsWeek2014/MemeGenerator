require 'RMagick'
include Magick

module MemesHelper

    def self.make_meme (textoben, textunten, template_id, meme_id)

        # Liest Text für oben und unten aus und übergibt ihn an die text_size_check methode

        text_size_check(textoben, meme_id, template_id, true)
        text_size_check(textunten, meme_id, template_id, false)

    end

    def self.text_size_check (text_check, meme_id, template_id, isup)

        # Prüft Text auf seine länge und passt entsprechen die übergebene Schriftgröße an
        case text_check.size
            when 101..120
                create_meme_imagemagick(text_check, meme_id, 15, template_id, isup)
            when 81..100
                create_meme_imagemagick(text_check, meme_id, 20, template_id, isup)
            when 61..80
                create_meme_imagemagick(text_check, meme_id, 25, template_id, isup)
            when 31..60
                create_meme_imagemagick(text_check, meme_id, 35, template_id, isup)
            when 11..30
                create_meme_imagemagick(text_check, meme_id, 50, template_id, isup)
            when 1..10
                create_meme_imagemagick(text_check, meme_id, 80, template_id, isup)
        end

    end

    def self.create_meme_imagemagick (text_check, meme_id, font_size, template_id, isup)

        original_image = Image.read("public/uploads/meme_template/template_img/" +  template_id + "/image.jpg").first

        # x und y Auflösung werden ausgelesen und in ein string konvertiert
        x_size = original_image.columns.to_s
        y_size = original_image.rows.to_s

        # output ordner erstellen, wenn nicht vorhanden
        unless Dir.exists?('public/uploads/generated_memes')
            Dir.mkdir 'public/uploads/generated_memes'            
        end

        if isup
        system("convert public/uploads/meme_template/template_img/" + template_id +  "/image.jpg -background transparent -fill white -pointsize " + font_size.to_s + " -size " + x_size + "x" + y_size + " -gravity North caption:'" + text_check + "' -composite public/uploads/generated_memes/" + meme_id.to_s + ".jpg")
        #puts "convert public/uploads/meme_template/template_img/" + template_id +  "/image.jpg -background transparent -fill white -pointsize " + font_size.to_s + " -size " + x_size + "x" + y_size + " -gravity North caption:'" + text_check + "' -composite public/uploads/generated_memes/" + meme_id.to_s + ".jpg"

        else
        # Text im unteren Bereich des Memes
        system("convert public/uploads/generated_memes/" + meme_id.to_s + ".jpg -background transparent -fill white -pointsize " + font_size.to_s + " -size " + x_size + "x" + y_size + " -gravity South caption:'" + text_check + "' -composite public/uploads/generated_memes/" + meme_id.to_s + ".jpg")
        end

    end
end

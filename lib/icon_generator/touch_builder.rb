module IconGenerator
    class TouchBuilder
        def initialize
            @sizes = [
                '144x144',
                '114x114',
                '72x72',
                '57x57',
            ]
        end

        def build(source, destination)
            @sizes.each do |size|
                new_image = "#{destination}/apple-touch-icon-#{size}-precomposed.png"
                build_size(source, size, new_image)
                if size == '57x57'
                    build_size(source, '57x57', "#{destination}/apple-touch-icon-precomposed.png")
                    build_size(source, '57x57', "#{destination}/apple-touch-icon.png")
                end
            end
        end

        def build_size(source, size, new_image)
            %x[convert '#{source}' -resize #{size}! #{new_image}]
            file_status new_image
        end

        def file_status(filename)
            raise IconGenerator::Error unless File.exists? filename
            puts Thor::Shell::Color.new.set_color("Built #{filename}", :green)
        end
    end
end

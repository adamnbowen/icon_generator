module IconGenerator
    class TouchBuilder
        include IconGenerator::Validator

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
            validate_file_status new_image
            puts Thor::Shell::Color.new.set_color("Built #{new_image}", :green)
        end
    end
end

module IconGenerator
    class TouchBuilder
        include IconGenerator::Validator

        # Initializes the default image sizes.
        def initialize
            @sizes = [
                '144x144',
                '114x114',
                '72x72',
                '57x57',
            ]
        end

        # Builds apple-touch-icons from the given source file.
        #
        # @param source [String] the source image file
        # @param destination [String] the output directory
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


        # Builds a given size of apple-touch-icon.
        #
        # @param source [String] the source image file
        # @param size [String] the requested image size, in WxH format
        # @param new_image [String] the output image
        def build_size(source, size, new_image)
            %x[convert '#{source}' -resize #{size}! #{new_image}]
            validate_file_status new_image
            puts Thor::Shell::Color.new.set_color("Built #{new_image}", :green)
        end
    end
end

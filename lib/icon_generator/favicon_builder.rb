module IconGenerator
    class FaviconBuilder
        include IconGenerator::Validator

        # Builds a multi-resolution favicon image by first generating
        # two temporary pngs—a 16x16 and a 32x32, and then shoving them
        # into a favicon.
        #
        # @param source [String] the source image file
        # @param destination [String] the output directory
        def build(source, destination)
            new_image = "#{destination}/favicon.ico"
            temp_16 = Tempfile.new('16x16')
            temp_32 = Tempfile.new('32x32')
            %x[convert '#{source}' -resize 16x16 -alpha on #{temp_16.path}]
            %x[convert '#{source}' -resize 32x32 -alpha on #{temp_32.path}]
            %x[convert #{temp_16.path} #{temp_32.path} #{new_image}]
            validate_file_status new_image
            puts Thor::Shell::Color.new.set_color("Built #{new_image}", :green)
        end
    end
end

module IconGenerator
    class FaviconBuilder
        include IconGenerator::Validator

        def build(source, destination)
            new_image = "#{destination}/favicon.ico"
            %x[convert '#{source}' -resize 16x16! -flatten -colors 256 -background transparent #{new_image}]
            validate_file_status new_image
            puts Thor::Shell::Color.new.set_color("Built #{new_image}", :green)
        end
    end
end

module IconGenerator
    class FaviconBuilder
        def initialize(source, destination)
            @source = source
            @destination = destination
        end

        def build
            new_image = "#{@destination}/favicon.ico"
            %x[convert '#{@source}' -resize 16x16! -flatten -colors 256 -background transparent #{new_image}]
            file_status new_image
        end

        def file_status(filename)
            raise IconGenerator::Error unless File.exists? filename
            puts Thor::Shell::Color.new.set_color("Built #{filename}", :green)
        end
    end
end

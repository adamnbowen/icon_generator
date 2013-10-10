module IconGenerator
    class Builder
        include IconGenerator::Validator

        # Sets up the source and destination instance variables, and
        # ensures they validate.
        #
        # @param source [String] the source image file
        # @param destination [String] the output directory
        def initialize(source, destination)
            @source = source
            @destination = destination
            validate_arguments @source, @destination
        end

        # Requests a build of the given image type.
        #
        # @param type [Symbol] the image type, `:touch` or `:favicon`
        def build(type)
            if type == :touch
                IconGenerator::TouchBuilder.new.build(@source, @destination)
            elsif type == :favicon
                IconGenerator::FaviconBuilder.new.build(@source, @destination)
            end
        end

        # Builds a single touch icon.
        def build_single
            IconGenerator::TouchBuilder.new.build_single(@source, @destination)
        end
    end
end

module IconGenerator
    class Thor < Thor
        desc 'touch', 'Generate apple-touch-icons'
        def touch(source, destination)
            validator = IconGenerator::Validator.new
            validator.validate_arguments source, destination
            builder = IconGenerator::TouchBuilder.new source, destination
            builder.build
        end

        desc 'favicon', 'Generate favicon'
        def favicon(source, destination)
            validator = IconGenerator::Validator.new
            validator.validate_arguments source, destination
            builder = IconGenerator::FaviconBuilder.new source, destination
            builder.build
        end
    end
end

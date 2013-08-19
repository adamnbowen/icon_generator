module IconGenerator
    class Thor < Thor
        desc 'touch', 'Generate apple-touch-icons'
        def touch(source, destination)
            build(:touch, source, destination)
        end

        desc 'favicon', 'Generate favicon'
        def favicon(source, destination)
            build(:favicon, source, destination)
        end

        desc 'build', 'Builds the requested file type', type: :hidden
        def build(type, source, destination)
            IconGenerator::Validator.new.validate_arguments source, destination
            IconGenerator::Builder.new.build type, source, destination
        end
    end
end

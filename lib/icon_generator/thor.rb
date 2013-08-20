module IconGenerator
    class Thor < Thor
        desc 'touch', 'Generate apple-touch-icons'
        def touch(source, destination)
            IconGenerator::Builder.new(source, destination).build(:touch)
        end

        desc 'favicon', 'Generate favicon'
        def favicon(source, destination)
            IconGenerator::Builder.new(source, destination).build(:favicon)
        end

        desc 'generate', 'Generate both a favicon and a touch icon'
        option :touch
        option :favicon
        def generate(destination)
            favicon(options[:favicon], destination) if options[:favicon]
            touch(options[:touch], destination) if options[:touch]
        end
    end
end

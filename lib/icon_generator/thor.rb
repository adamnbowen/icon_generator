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
    end
end

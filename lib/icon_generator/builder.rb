module IconGenerator
    class Builder
        def build(type, source, destination)
            if type == :touch
                IconGenerator::TouchBuilder.new.build(source, destination)
            elsif type == :favicon
                IconGenerator::FaviconBuilder.new.build(source, destination)
            end
        end
    end
end

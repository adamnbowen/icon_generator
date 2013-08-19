module IconGenerator
    class Builder
        include IconGenerator::Validator

        def initialize(source, destination)
            @source = source
            @destination = destination
            validate_arguments @source, @destination
        end

        def build(type)
            if type == :touch
                IconGenerator::TouchBuilder.new.build(@source, @destination)
            elsif type == :favicon
                IconGenerator::FaviconBuilder.new.build(@source, @destination)
            end
        end
    end
end

module IconGenerator
    class Validator
        def initialize
            @errors = []
        end

        def validate_arguments(source, destination)
            @errors << '1st argument must be a valid png' unless source.match /\.png$/
            @errors << '1st argument must be an existing file' unless File.exists? source
            @errors << '2nd argument must be an existing directory' unless Dir.exists? destination

            raise IconGenerator::Error, @errors.first unless @errors.empty?
        end
    end
end

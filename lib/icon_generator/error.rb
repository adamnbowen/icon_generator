module IconGenerator
    class Error < Thor::Error
        def initialize(message = "Icon generation failed")
            super(Thor::Shell::Color.new.set_color message, :red)
        end
    end
end

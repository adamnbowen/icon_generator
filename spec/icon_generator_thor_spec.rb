require 'spec_helper'

describe IconGenerator::Thor do
    let (:tmp) { Dir.tmpdir }

    it "generates a favicon" do
        tempfile = Tempfile.new ['test', '.png']
        %x[convert -size 1x1 canvas:khaki #{tempfile.path}]
        stdout = %x[bundle exec bin/icon_generator favicon #{tempfile.path} #{tmp}]
        stdout.must_include "Built #{tmp}/favicon.ico"
    end

    it "generates apple-touch-icons" do
        tempfile = Tempfile.new ['test', '.png']
        %x[convert -size 1x1 canvas:khaki #{tempfile.path}]
        stdout = %x[bundle exec bin/icon_generator touch #{tempfile.path} #{tmp}]
        stdout.must_include "Built #{tmp}/apple-touch-icon.png"
    end

    it "can take both favicon and touch commands at once" do
        touch = Tempfile.new ['touch', '.png']
        favicon = Tempfile.new ['favicon', '.png']
        %x[convert -size 1x1 canvas:khaki #{touch.path}]
        %x[convert -size 1x1 canvas:khaki #{favicon.path}]
        stdout = %x[bundle exec bin/icon_generator generate --touch #{touch.path} --favicon #{favicon.path} #{tmp}]
        stdout.must_include "Built #{tmp}/favicon.ico"
        stdout.must_include "Built #{tmp}/apple-touch-icon.png"
    end

    it "can build either touch or favicon alone from generate" do
        touch = Tempfile.new ['touch', '.png']
        favicon = Tempfile.new ['favicon', '.png']
        %x[convert -size 1x1 canvas:khaki #{touch.path}]
        %x[convert -size 1x1 canvas:khaki #{favicon.path}]
        stdout = %x[bundle exec bin/icon_generator generate --touch #{touch.path} #{tmp}]
        stdout.must_include "Built #{tmp}/apple-touch-icon.png"
        stdout = %x[bundle exec bin/icon_generator generate --favicon #{favicon.path} #{tmp}]
        stdout.must_include "Built #{tmp}/favicon.ico"
    end
end

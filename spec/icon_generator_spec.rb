require 'spec_helper'

describe IconGenerator do
    before do
        Dir.mkdir('tmp')
    end

    after do
        FileList['tmp/*'].each do |file|
            File.delete file
        end
        Dir.rmdir('tmp')
    end

    it "requires the source file to exist" do
        fake_file = -> { IconGenerator::Builder.new('missing.png', 'tmp') }
        raised_error = fake_file.must_raise IconGenerator::Error
        raised_error.to_s.must_match '1st argument must be an existing file'
    end

    it "requires the source file to have a supported extension" do
        html = -> { IconGenerator::Builder.new('index.html', 'tmp') }
        raised_error = html.must_raise IconGenerator::Error
        raised_error.to_s.must_match '1st argument must be a valid image'
    end

    it "requires the output directory to exist" do
        %x[convert -size 1x1 canvas:khaki tmp/test.png]
        missing = -> { IconGenerator::Builder.new('tmp/test.png', 'missing') }
        raised_error = missing.must_raise IconGenerator::Error
        raised_error.to_s.must_match '2nd argument must be an existing directory'
    end

    it "creates a favicon when requested" do
        %x[convert -size 1x1 canvas:khaki tmp/test.png]
        builder = IconGenerator::Builder.new('tmp/test.png', 'tmp')
        stdout = capture_io { builder.build(:favicon) }.to_s
        File.exists?('tmp/favicon.ico').must_be :==, true
        stdout.must_include 'Built tmp/favicon.ico'
    end

    it "creates apple-touch-icons when requested" do
        %x[convert -size 1x1 canvas:khaki tmp/test.png]
        builder = IconGenerator::Builder.new('tmp/test.png', 'tmp')
        stdout = capture_io { builder.build(:touch) }.to_s

        files = [
            'tmp/apple-touch-icon.png',
            'tmp/apple-touch-icon-precomposed.png',
            'tmp/apple-touch-icon-144x144-precomposed.png',
            'tmp/apple-touch-icon-114x114-precomposed.png',
            'tmp/apple-touch-icon-72x72-precomposed.png',
            'tmp/apple-touch-icon-57x57-precomposed.png',
        ]

        files.each do |file|
            File.exists?(file).must_be :==, true
            stdout.must_include "Built #{file}"
        end
    end

    it "works with jpgs as a source file" do
        %x[convert -size 1x1 canvas:khaki tmp/test.jpg]
        builder = IconGenerator::Builder.new('tmp/test.jpg', 'tmp')
        stdout_favicon = capture_io { builder.build(:favicon) }.to_s
        stdout_favicon.must_include 'Built tmp/favicon.ico'
        stdout_touch = capture_io { builder.build(:touch) }.to_s
        stdout_touch.must_include 'Built tmp/apple-touch-icon.png'
    end

    it "works with gifs as a source file" do
        %x[convert -size 1x1 canvas:khaki tmp/test.gif]
        builder = IconGenerator::Builder.new('tmp/test.gif', 'tmp')
        stdout_favicon = capture_io { builder.build(:favicon) }.to_s
        stdout_favicon.must_include 'Built tmp/favicon.ico'
        stdout_touch = capture_io { builder.build(:touch) }.to_s
        stdout_touch.must_include 'Built tmp/apple-touch-icon.png'
    end
end

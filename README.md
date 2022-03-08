# IconGenerator

[![Gem Version](https://badge.fury.io/rb/icon_generator.png)](http://badge.fury.io/rb/icon_generator)
[![Code Climate](https://codeclimate.com/github/adamnbowen/icon_generator.png)](https://codeclimate.com/github/adamnbowen/icon_generator)
[![Build Status](https://travis-ci.org/adamnbowen/icon_generator.png)](https://travis-ci.org/adamnbowen/icon_generator)
[![Dependency Status](https://gemnasium.com/adamnbowen/icon_generator.png)](https://gemnasium.com/adamnbowen/icon_generator)

❗Note that this project is unmaintained

Generates Apple Touch Icons or a multiresolution (32x32 and 16x16)
favicon given a square image.

## Installation

    $ gem install icon_generator

## Dependencies

* Ruby 1.9.3 and up
* ImageMagick
* [Thor](http://whatisthor.com/)

## Usage

To generate a set of apple-touch-icons:

    $ icon_generator touch my/source/file.png my/output/directory

To generate a single 152x152 apple-touch-icon-precomposed.png:

    $ icon_generator touch my/source/file.png my/output/directory --single


To generate a multiresolution favicon:

    $ icon_generator favicon my/source/file.png my/output/directory

To generate both at once:

    $ icon_generator generate --favicon my/source/favicon.png --touch my/source/touch.png my/output/directory

The generic `generate` task will work whether both `--favicon` and
`--touch` are present or not:

    $ icon_generator generate --favicon my/source/favicon.png my/output/directory

## Testing

    $ rake test

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request

# GeojsonModel

Geojson as a model. Provides simple objects to manipulate geojson data.

[![Gem Version](https://badge.fury.io/rb/geojson_model.png)](http://badge.fury.io/rb/geojson_model)
[![Code Climate](https://codeclimate.com/github/can-explore/geojson_model/badges/gpa.svg)](https://codeclimate.com/github/can-explore/geojson_model)
[![Coverage Status](https://coveralls.io/repos/can-explore/geojson_model/badge.svg)](https://coveralls.io/r/can-explore/geojson_model)
[![Build Status](https://travis-ci.org/can-explore/geojson_model.png)](https://travis-ci.org/can-explore/geojson_model)

## Usage

```ruby
g = GeojsonModel::Geometry.new(type: 'Point', coordinates: [0, 0]) # => #<GeojsonModel::Geometry ...>
g.to_h # => { type: 'Point', coordinates: [0, 0] }
g.to_json # => "{"type":"Point","coordinates":[0,0]}"

f = GeojsonModel::Feature.new(properties: {foo: 'bar'}, geometry: g) # => #<GeojsonModel::Feature ...>
f.to_h # => { type:'Feature', geometry:#<GeojsonModel::Geometry ...>, properties:{foo: 'bar'} }
f.to_json # => "{"type":"Feature","geometry":{"type":"Point","coordinates":[0,0]},"properties":{"foo":"bar"}}"

gc = GeojsonModel::GeometryCollection.new(geometries: [g]) # => #<GeojsonModel::Feature ...>
gc.to_h # => { type: 'GeometryCollection', geometries: [#<GeojsonModel::Geometry ...>] }
gc.to_json # => "{"type":"GeometryCollection","geometries":[{"type":"Point","coordinates":[0,0]}]}"

fc = GeojsonModel::FeatureCollection.new(features: [f]) # => #<GeojsonModel::Feature ...>
fc.to_h # => { type: 'FeatureCollection', features: [#<GeojsonModel::Feature geometry=#<GeojsonModel::Geometry ...> ...>] }
fc.to_json # => "{"type":"FeatureCollection","features":[{"type":"Feature","geometry":{"type":"Point","coordinates":[0,0]},"properties":{"foo":"bar"}}]}"

g.to_feature # => #<GeojsonModel::Feature ...>
f.to_geometry # => #<GeojsonModel::Geometry ...>
gc.to_feature_collection # => #<GeojsonModel::FeatureCollection ...>
fc.to_geometry_collection # => #<GeojsonModel::GeometryCollection ...>
```

Plays well with `ActiveRecord`, PostgreSQL jsonb (or json) data type and [geojsonlint](https://github.com/can-explore/geojsonlint).

```ruby
# db/migrations/create_places.rb
create_table :places do |t|
  t.jsonb :geojson # or t.json :geojson
end

# models/place.rb
class Place < ActiveRecord::Base
  validates :geojson, geojson: true
end

p = Place.new
p.geojson = GeojsonModel::Feature.new(geometry: GeojsonModel::Geometry.new).to_json
p.valid? # => true
```

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'geojson_model'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install geojson_model

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release` to create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

1. Fork it ( https://github.com/can-explore/geojson_model/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create a new Pull Request
6. Thank you!

## License

`geojson_model` is © 2015 Can-Explore and may be freely distributed under the New BSD license. See the `LICENSE.md` file.

## About Can-Explore

Can-Explore is a team of passionate people brdiging the gap between technology and the world of civil engineering. We love building new things and get out of our comfort zone.

We love [open-source](https://github.com/can-explore) and we try to give back to the community as much as we can.

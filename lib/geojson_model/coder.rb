require 'geojson_model/base'

module GeojsonModel
  class Coder

    # takes the database value and returns an instance of the GeojsonModel class
    def self.load(value)
      dispatch(JSON.load(value))
    end

    # takes an object and returns the value to be stored in the database
    def self.dump(object)
      object.to_json
    end


    private

    # @param data [Hash]
    def self.dispatch(data)
      if hash.has_key?('geometries')
        GeometryCollection.new(data)
      elsif data.has_key?('coordinates')
        Geometry.new(data)
      elsif data.has_key?('features')
        FeatureCollection.new(data)
      elsif data.has_key?('properties')
        Feature.new(data)
      else
        raise TypeError
      end
    end
  end
end

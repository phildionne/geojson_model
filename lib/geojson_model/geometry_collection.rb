require 'geojson_model/base'

module GeojsonModel
  class GeometryCollection
    include Base

    attribute :type,        String, default: 'GeometryCollection'
    attribute :coordinates, Array[GeojsonModel::Geometry]

    # @return [FeatureCollection]
    def to_feature_collection
      FeatureCollection.new(features: geometries.map { |geo| Feature.new(geometry: geo) })
    end
  end
end

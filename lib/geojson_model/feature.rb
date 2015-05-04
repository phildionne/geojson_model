require 'geojson_model/base'

module GeojsonModel
  class Feature
    include Base

    attribute :type,       String, default: 'Feature'
    attribute :geometry,   GeojsonModel::Geometry
    attribute :properties, Hash

    # @return [Geometry]
    def to_geometry
      geometry || Geometry.new
    end
  end
end

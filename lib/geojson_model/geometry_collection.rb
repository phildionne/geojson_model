require 'geojson_model/base'

module GeojsonModel
  class GeometryCollection
    include Base

    attribute :type,        String, default: 'GeometryCollection'
    attribute :coordinates, Array[GeojsonModel::Geometry]
  end
end

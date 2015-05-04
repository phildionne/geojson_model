require 'geojson_model/base'

module GeojsonModel
  class Geometry
    include Base

    attribute :type,        String, default: 'Geometry'
    attribute :coordinates, Array
  end
end

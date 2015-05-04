require 'geojson_model/base'

module GeojsonModel
  class FeatureCollection
    include Base

    attribute :type,     String, default: 'FeatureCollection'
    attribute :features, Array[GeojsonModel::Feature]
  end
end

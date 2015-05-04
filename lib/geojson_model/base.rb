require 'active_support/concern'
require 'virtus'
require 'active_model'

module GeojsonModel
  module Base
    extend ActiveSupport::Concern

    included do
      include Virtus.model
      include ActiveModel::Serializers::JSON
    end

    def attributes=(hash)
      hash.each do |key, value|
        send("#{key}=", value)
      end
    end

    def attributes
      instance_values
    end

    alias_method :to_geojson, :to_json
  end
end

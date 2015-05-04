require 'spec_helper'

describe GeojsonModel::FeatureCollection do

  describe 'InstanceMethods' do

    describe 'type' do

      it 'is of type String' do
        expect(subject.type).to be_a(String)
      end

      it 'is set by default' do
        expect(subject.type).to eq('FeatureCollection')
      end
    end

    describe 'features' do

      it 'is of type Array' do
        expect(subject.features).to be_a(Array)
      end
    end

    describe 'to_geometry_collection' do

      it 'is of type GeometryCollection' do
        expect(subject.to_geometry_collection).to be_a(GeojsonModel::GeometryCollection)
      end
    end
  end
end

require 'spec_helper'

describe GeojsonModel::GeometryCollection do

  describe 'InstanceMethods' do

    describe 'type' do

      it 'is of type String' do
        expect(subject.type).to be_a(String)
      end

      it 'is set by default' do
        expect(subject.type).to eq('GeometryCollection')
      end
    end

    describe 'geometries' do

      it 'is of type Array' do
        expect(subject.geometries).to be_a(Array)
      end
    end

    describe 'to_feature_collection' do

      it 'is of type FeatureCollection' do
        expect(subject.to_feature_collection).to be_a(GeojsonModel::FeatureCollection)
      end
    end
  end
end

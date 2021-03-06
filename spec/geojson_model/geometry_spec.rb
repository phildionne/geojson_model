require 'spec_helper'

describe GeojsonModel::Geometry do

  describe 'InstanceMethods' do

    describe 'type' do

      it 'is of type String' do
        # Workaround to test type
        expect(GeojsonModel::Geometry.attribute_set[:type].primitive).to eq(String)
      end
    end

    describe 'coordinates' do

      it 'is of type Array' do
        expect(subject.coordinates).to be_a(Array)
      end
    end

    describe 'to_feature' do

      it 'is of type Feature' do
        expect(subject.to_feature).to be_a(GeojsonModel::Feature)
      end
    end
  end
end

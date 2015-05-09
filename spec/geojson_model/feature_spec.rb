require 'spec_helper'

describe GeojsonModel::Feature do

  describe 'InstanceMethods' do

    describe 'type' do

      it 'is of type String' do
        expect(subject.type).to be_a(String)
      end

      it 'is set by default' do
        expect(subject.type).to eq('Feature')
      end
    end

    describe 'geometry' do

      it 'is of type GeojsonModel::Geometry' do
        subject.geometry = {}
        expect(subject.geometry).to be_a(GeojsonModel::Geometry)
      end
    end

    describe 'properties' do

      it 'is of type Hash' do
        expect(subject.properties).to be_a(Hash)
      end
    end

    describe 'to_geometry' do

      it 'is of type Geometry' do
        expect(subject.to_geometry).to be_a(GeojsonModel::Geometry)
      end
    end
  end
end

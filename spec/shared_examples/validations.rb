shared_context 'Requires Presence' do |factory, attributes|
  attributes.each do |attr|
    it "validates presence of #{attr}" do
      expect(build(factory, attr.to_sym => nil)).not_to be_valid
    end
  end
end

shared_context 'Requires Uniqueness' do |factory, attribute_hash|
  attribute_hash.each do |attr, value|
    it "validates uniqueness of #{attr}" do
      expect(create(factory, attr.to_sym => value)).to be_valid
      expect(build(factory, attr.to_sym => value)).not_to be_valid
    end
  end
end

shared_context 'Requires Length' do |factory, attributes|
  attributes.each do |attr|
    it "validates Length of #{attr}" do
      should validate_length_of(attr.to_sym)
    end
  end
end
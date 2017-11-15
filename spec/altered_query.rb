require "spec_helper"

describe Luis::AlteredQuery do
  let(:payload) { "quiero sacar mi acta de nacimiento" }

  it "is generated correctly from a payload response" do
    expect { Luis::AlteredQuery.new(payload) }.not_to raise_error
  end

  it "contains all fields from remote entity" do
    ce = Luis::AlteredQuery.new(payload)
    expect(ce.text).to eq(payload)
  end
end

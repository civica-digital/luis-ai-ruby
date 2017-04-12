require "spec_helper"

describe Luis::CompositeEntity do
  let(:payload) {
    {
      "parentType" => "vehicleright",
      "value" => "vehicle",
      "children" => {
        "type" => "procedure",
        "value" => "vehicle"
      }
    }
  }

  it "is generated correctly from a payload response" do
    expect { Luis::CompositeEntity.new(payload) }.not_to raise_error
  end

  it "contains all fields from remote entity" do
    ce = Luis::CompositeEntity.new(payload)
    expect(ce.name).to eq(:vehicleright)
    expect(ce.value).to eq("vehicle")
    expect(ce.children.type).to eq("procedure")
    expect(ce.children.value).to eq("vehicle")
  end
end

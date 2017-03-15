require "spec_helper"

describe Luis::Entity do
  let(:payload) {
    {
      "entity" => "taco",
      "type" => "food",
      "startIndex" => 13,
      "endIndex" => 16,
      "score" => 0.916118264
    }
  }

  it "is generated correctly from a payload response" do
    expect { Luis::Entity.new(payload) }.not_to raise_error
  end

  it "contains all fields from remote entity" do
    e = Luis::Entity.new(payload)
    expect(e.name).to eq("taco")
    expect(e.type).to eq(:food)
    expect(e.start_index).to eq(13)
    expect(e.end_index).to eq(16)
    expect(e.score).to eq(0.916118264)
  end
end

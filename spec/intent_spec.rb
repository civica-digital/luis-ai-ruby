require "spec_helper"

describe Luis::Intent do
  let(:payload) {
    {
      "intent" => "select service",
      "score" => 0.9999995
    }
  }

  it "is generated correctly from a payload response" do
    expect { Luis::Intent.new(payload) }.not_to raise_error
  end

  it "contains all fields from remote entity" do
    i = Luis::Intent.new(payload)
    expect(i.name).to eq("select service")
    expect(i.score).to eq(0.9999995)
  end
end

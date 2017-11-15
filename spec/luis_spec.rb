require "spec_helper"

describe Luis do
  let(:payload) {
    {
      "query" => "Quiero pagar tenensia",
      "alteredQuery" => "Quiero pagar tenencia",
      "topScoringIntent" => {
        "intent" => "select service",
        "score" => 0.9999995
      },
      "intents" => [
        {
          "intent" => "select service",
          "score" => 0.9999995
        },
        {
          "intent" => "None",
          "score" => 0.0412132144
        }
      ],
      "entities" => [
        {
          "entity" => "tenencia",
          "type" => "service",
          "startIndex" => 13,
          "endIndex" => 20,
          "score" => 0.916118264
        },
        {
          "entity" => "quiero",
          "type" => "need",
          "startIndex" => 0,
          "endIndex" => 5,
          "score" => 0.954107046
        },
        {
          "entity" => "pagar",
          "type" => "verb",
          "startIndex" => 7,
          "endIndex" => 11,
          "score" => 0.959142148
        }
      ]
    }
  }

  it "has a version number" do
    expect(Luis::VERSION).not_to be nil
  end

  it "parses a query response correctly" do
    response = nil
    expect { response = Luis.parse_response(payload) }.not_to raise_error
    expect(response).not_to be nil
    expect(response.query).to eq("Quiero pagar tenensia")
    expect(response.intents.length).to eq(2)
    expect(response.top_scoring_intent.name).to eq("select service")
    expect(response.entities.length).to eq(3)
    expect(response.altered_query.text).to eq("Quiero pagar tenencia")
  end
end

require 'spec_helper'

describe Whales::FeatureCollection do
  before {
    @attributes = [{"type":"feature","name":"Ruby","description":"The application uses Ruby code","categories":["Language"],"cue_locations":["Gemfile","Gemfile.lock","Rakefile","belugas.gemspec","bin/belugas-linguist","bin/console","lib/belugas.rb","lib/belugas/language.rb","lib/belugas/languages/collection.rb","lib/belugas/project.rb","lib/belugas/report.rb","lib/belugas/serializers.rb","lib/belugas/serializers/base.rb","lib/belugas/serializers/language.rb","lib/belugas/serializers/project.rb","lib/belugas/utils.rb","lib/belugas/version.rb","spec/belugas_spec.rb","spec/spec_helper.rb"],"engines":["belugas"],"meta":{"ratio":0.984772753690573,"total_files":20}},{"type":"feature","name":"Shell","description":"The application uses Shell code","categories":["Language"],"cue_locations":["bin/setup"],"engines":["belugas"],"meta":{"ratio":0.015227246309426944,"total_files":20}}]}

  subject { Whales::FeatureCollection.new(@attributes.to_json)}

  it 'has features' do
    expect(subject.features.sample).to be_kind_of(Whales::Feature)
  end

  it 'has a dominant language' do
    expect(subject.dominant_language.name).to eq("Ruby")
  end

  it 'has language features' do
    expect(subject.language_features.sample).to be_kind_of(Whales::Feature)
  end

  it 'renders features'do
    expect(subject.to_json.sample).to have_key(:type)
  end
end

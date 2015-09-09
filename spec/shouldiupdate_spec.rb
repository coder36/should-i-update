require 'rspec'
require 'spec_helper'

require './lib/shouldiupdate'

describe '#should_i_update' do

  context "Gemfile needs updating" do
    it "tells me about if I need to update my gem versions" do
      expect{ should_i_update }.to output(/timers \(newest 4.1.1, installed 4.0.1\)/).to_stdout
      expect{ should_i_update }.to output(/capybara \(newest 2.5.0, installed 2.4.4\)/).to_stdout
    end

    it "returns true gemfile needs updating" do
      expect( should_i_update ).to eq(true)
    end
  end

end

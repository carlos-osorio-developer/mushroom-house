require 'rails_helper'

# Specs in this file have access to a helper object that includes
# the ArticlesHelper. For example:
#
# describe ArticlesHelper do
#   describe "string concat" do
#     it "concats two strings with spaces" do
#       expect(helper.concat_strings("this","that")).to eq("this that")
#     end
#   end
# end
RSpec.describe ArticlesHelper, type: :helper do  
  
  describe "search checker" do
    it "ask for a search if nil" do
      search = nil
      expect(helper.has_seached?(search)).to eq("Please enter a search")
    end

    it "return a string presenting results" do
      search = 'RandomSearch'
      expect(helper.has_seached?(search)).to eq("Showing results for: '#{search}'")
    end
  end

  describe "empty results displayer" do
    it "return a string for empty results" do
      results = []
      expect(helper.search_results?(results)).to eq('There are no results for this search.')
    end

    it "return a string for unexisting search" do
      results = nil
      expect(helper.search_results?(results)).to eq('There are no results for this search.')
    end
  end

end

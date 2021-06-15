require 'rails_helper'

# Specs in this file have access to a helper object that includes
# the SessionsHelper. For example:
#
# describe SessionsHelper do
#   describe "string concat" do
#     it "concats two strings with spaces" do
#       expect(helper.concat_strings("this","that")).to eq("this that")
#     end
#   end
# end
RSpec.describe SessionsHelper, type: :helper do

  describe "user login" do
    it "logs a user" do      
      user = User.create(name: 'NewUser')  
      expect(helper.log_in(user)).to eq(session[:user_id] = user.id)
    end

    it "return a string presenting results" do
      search = 'RandomSearch'
      expect(helper.has_seached?(search)).to eq("Showing results for: '#{search}'")
    end
  end
end

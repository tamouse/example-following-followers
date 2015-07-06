require 'rails_helper'

RSpec.describe User, type: :model do

  describe "Follower - Following Relationships" do
    let(:mike) {User.create(name: "Mike")}
    let(:jane) {User.create(name: "Jane")}
    before do
      mike.follow(jane)
    end

    it "Mike follows Jane" do
      expect(mike.following).to include(jane)
    end

    it "Jane is followed by Mike" do
      expect(jane.followers).to include(mike)
    end
  end
end

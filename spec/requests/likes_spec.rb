require 'rails_helper'

RSpec.describe "Likes", type: :request do
  describe "GET /posts" do
    it "returns http success" do
      get "/likes/posts"
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET /users" do
    it "returns http success" do
      get "/likes/users"
      expect(response).to have_http_status(:success)
    end
  end

end

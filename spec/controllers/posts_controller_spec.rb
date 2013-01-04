require 'spec_helper'

describe PostsController, "Routing" do
  it {{get: "/"}.should route_to(controller: "posts",
                                 action: "index")}
  it {{get: "/posts"}.should route_to(controller: "posts",
                                       action: "index")}
  it {{get: "/posts/1"}.should route_to(controller: "posts",
                                         action: "show",
                                         id: "1")}
end

describe PostsController, "Actions" do
  render_views
  describe "As a visitor" do

    describe "on GET to #index" do

      it "should load a list of posts" do
        get :index
        assigns(:posts).should_not be_nil   
      end

      it "should render the index template" do
        get :index
        should render_template(:index)
      end
    end

    describe "on GET new" do
      it "should redirect to the login page for user not authenticate" do
        get :new
        should redirect_to new_user_session_path
      end
    end

    describe "on POST create" do
      it "should redirect the login page for user not authenticate" do
        post :create
        should redirect_to new_user_session_path
      end
    end

    describe "on GET show" do
      before do
        @post = FactoryGirl.create(:post)
        get :show, id: @post.to_param
      end

      it "shoul load a post" do
        assigns(:post).should_not be_nil
      end
    end
  end

  describe "as a authenticate user" do
    
  end
end

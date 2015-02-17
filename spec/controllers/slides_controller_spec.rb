require 'spec_helper'

describe SlidesController do
  let(:valid_file) {Rack::Test::UploadedFile.new("public/images/test.jpg",'image/jpg')}
  let(:valid_attributes) { { "file" => valid_file, "title" => "some Title", "caption" => "A Caption" } }
  let(:valid_session) { {} }

  describe "GET index" do
    it "assigns all slides as @slides" do
      slide = Slide.create! valid_attributes
      get :index, {}, valid_session
      assigns(:slides).should eq([slide])
    end
  end

  describe "GET new" do
    it "assigns a new slide as @slide" do
      get :new, {}, valid_session
      assigns(:slide).should be_a_new(Slide)
    end
  end

  describe "GET edit" do
    it "assigns the requested slide as @slide" do
      slide = Slide.create! valid_attributes
      get :edit, {id: slide.to_param}, valid_session
      assigns(:slide).should eq(slide)
    end
  end

  describe "POST create" do
    describe "with valid params" do
      it "creates a new slide" do
        expect {
          post :create, {:slide => valid_attributes}, valid_session
        }.to change(Slide, :count).by(1)
      end

      it "assigns a newly created slide as @slide" do
        post :create, {:slide => valid_attributes}, valid_session
        assigns(:slide).should be_a(Slide)
        assigns(:slide).should be_persisted
      end

      it "redirects to the created slide" do
        post :create, {:slide => valid_attributes}, valid_session
        response.should redirect_to(Slide.last)
      end
    end

    describe "with invalid params" do
      it "assigns a newly created but unsaved slide as @slide" do
        Slide.any_instance.stub(:save).and_return(false)
        post :create, {:slide => { "slide_name" => "invalid value" }}, valid_session
        assigns(:slide).should be_a_new(Slide)
      end

      it "re-renders the 'new' template" do
        Slide.any_instance.stub(:save).and_return(false)
        post :create, {:slide => { "slide_name" => "invalid value" }}, valid_session
        response.should render_template("new")
      end
    end
  end

  describe "DELETE destroy" do
    it "destroys the requested slide" do
      slide = Slide.create! valid_attributes
      expect {
        delete :destroy, {:id => slide.to_param}, valid_session
      }.to change(Slide, :count).by(-1)
    end

    it "redirects to the slides list" do
      slide = Slide.create! valid_attributes
      delete :destroy, {:id => slide.to_param}, valid_session
      response.should redirect_to(slides_url)
    end
  end

end

require 'rails_helper'

RSpec.describe QuestionsController, type: :controller do
  let(:question) {create :question}

  describe "GET #index" do
    it "returns a success response" do
      get :index, params: {}
      expect(response).to be_success
    end
  end

  describe "GET #show" do
    it "returns a success response" do
      get :show, params: {id: question.id}
      expect(response).to be_success
    end
  end

  describe "GET #new" do
    it "returns a success response" do
      get :new, params: {}
      expect(response).to be_success
    end
  end

  describe "GET #edit" do
    it "returns a success response" do
      get :edit, params: {id: question.id}
      expect(response).to be_success
    end
  end

  describe "POST #create" do
    context "with valid params" do
      it "creates a new Question" do
        expect {
          post :create, params: {question: {content: "New question ?"}}
        }.to change(Question, :count).by(1)
      end
    end

    context "with invalid params" do
      it "do not create a question" do
        expect {
          post :create, params: {question: {content: nil}}
        }.to change(Question, :count).by(0)
      end
    end
  end

  describe "PUT #update" do
    context "with valid params" do

      it "updates the question" do
        put :update, params: {id: question.id, question: {content: "My edited question ?"}}
        question.reload
        expect(question.content).to eq "My edited question ?"
      end
    end

    context "with invalid params" do
      it "do not updates the question" do
        put :update, params: {id: question.id, question: {content: nil}}
        question.reload
        expect(question.content).to_not eq ""
      end
    end
  end

  describe "DELETE #destroy" do
    it "destroys the requested question" do
      question
      expect {
        delete :destroy, params: {id: question.id}
      }.to change(Question, :count).by(-1)
    end
  end

end

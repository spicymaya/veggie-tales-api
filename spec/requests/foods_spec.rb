require 'rails_helper'

RSpec.describe "Foods API", :type => :request do
  let!(:foods) {create_list(:food, 10)}
  let(:food_id){foods.first.id}
# Test suite for GET /foods
  describe 'get foods' do
    before {get '/foods'}
    it 'returns foos' do 
      expect(json).not_to be_empty
      expect(json.size).to eq(10)
    end
    it 'returns 200' do
    expect(response).to have_http_status(200)
    end

  end
  describe 'GET /foods/:id' do
    before {get "/foods/#{food_id}"}

    context 'when record exists' do
      it 'returns foos' do 
        expect(json).not_to be_empty
        expect(json['id']).to eq(food_id)
      end
      it 'returns 200' do
      expect(response).to have_http_status(200)
      end
    end

    context 'when record does not exist' do
      let(:food_id) {1000}
      it 'returns error message' do
        expect(response.body).to match(/Couldn't find Food with 'id'=1000/)
      end
      it 'returns status 404' do
        expect(response).to have_http_status(404)
      end
    end
  end
  # Test suite for POST /foods
  describe 'POST /foods' do
    let(:valid_params) { { name: 'Pepper', region: 'Belarus', type: 'vegetable' } }
    before {post "/foods", params: valid_params }
    
    context'when request is valid'do
      it'name should be Pepper'do
        expect(json['name']).to eq('Pepper')
      end
      it 'returns status created=201' do
        expect(response).to have_http_status(201)
      end

    end
    context'when request is not valid'do
    let(:valid_params) { { region: 'Belarus', type:'vegetable'} }
      it 'returns error message' do
        expect(response.body).to match(/Name can't be blank/)
      end
      it 'returns status unprocessable entity=422' do
        expect(response).to have_http_status(422)
      end
  
    end

  end   

  # Test suite for PUT /foods  
  describe 'PUT /foods/:id' do
    let(:valid_params) { { name: 'Pepper', region: 'Belarus', type: 'vegetable' } }
    before {put "/foods/#{food_id}", params: valid_params }
    context 'when item exists' do
     
      it('updates the item') do
        expect(response.body).to be_empty
      end
      it('returns status code 204: no content') do
        expect(response).to have_http_status(204)
      end
      
    end
    context 'when item does not exist' do
      let(:food_id) {1000}
      it('returns status code 404') do
        expect(response).to have_http_status(404)
      end
    end

  end
  # Test suite for DELETE /foods 
  describe 'DELETE /foods/:id' do
    before {delete "/foods/#{food_id}"}
    context 'when item exists' do
      it 'deletes food' do 
        expect(response.body).to be_empty
      end
      it 'returns 204' do
        expect(response).to have_http_status(204)
      end
    end
    context 'when item does not exist' do
      let(:food_id) {1000}
      it('returns status code 404') do
        expect(response).to have_http_status(404)
      end
    end
    

  end

end
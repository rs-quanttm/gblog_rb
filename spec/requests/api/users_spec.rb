require 'swagger_helper'

RSpec.describe 'api/users', type: :request do
  before do
    create(:user)
  end

  # jitera-hook-for-rswag-example

  path '/api/users/{id}' do
    delete 'Destroy users' do
      tags 'users'
      consumes 'application/json'
      parameter name: 'id', in: :path, type: 'string', description: 'id'
      parameter name: :params, in: :body, schema: {
        type: :object,
        properties: {
          users: {
            type: :object,
            properties: {
              email: {
                type: :string,
                example: 'string'
              }

            }
          }
        }
      }
      response '200', 'delete' do
        examples 'application/json' => {
          'message' => {}

        }

        let(:resource) { create(:user) }

        let(:params) {}

        let(:id) { resource.id }

        run_test! do |response|
          expect(response.status).to eq(200)
        end
      end
    end
  end

  path '/api/users/{id}' do
    put 'Update users' do
      tags 'users'
      consumes 'application/json'
      parameter name: 'id', in: :path, type: 'string', description: 'id'
      parameter name: :params, in: :body, schema: {
        type: :object,
        properties: {
          users: {
            type: :object,
            properties: {
              email: {
                type: :string,
                example: 'string'
              },

              roles: {
                type: :enum_type,
                example: 'enum_type'
              }

            }
          }
        }
      }
      response '200', 'update' do
        examples 'application/json' => {
          'user' => {
            'id' => 'integer',

            'created_at' => 'datetime',

            'updated_at' => 'datetime',

            'email' => 'string',

            'posts' =>
  [
    {

      'id' => 'integer',

      'created_at' => 'datetime',

      'updated_at' => 'datetime',

      'title' => 'string',

      'content' => 'string',

      'user_id' => 'foreign_key'

    }
  ],

            'roles' => 'enum_type',

            'comments' =>
  [
    {

      'id' => 'integer',

      'created_at' => 'datetime',

      'updated_at' => 'datetime',

      'content' => 'string',

      'user_id' => 'foreign_key'

    }
  ],

            'likes' =>
  [
    {

      'id' => 'integer',

      'created_at' => 'datetime',

      'updated_at' => 'datetime',

      'user_id' => 'foreign_key'

    }
  ]

          },

          'error_object' => {}

        }

        let(:resource) { create(:user) }

        let(:id) { resource.id }

        let(:params) { { id: id, users: { id: id } } }

        run_test! do |response|
          expect(response.status).to eq(200)
        end
      end
    end
  end

  path '/api/users/{id}' do
    get 'Show users' do
      tags 'users'
      consumes 'application/json'
      parameter name: 'id', in: :path, type: 'string', description: 'id'
      parameter name: :params, in: :body, schema: {
        type: :object,
        properties: {
          users: {
            type: :object,
            properties: {
              email: {
                type: :string,
                example: 'string'
              }

            }
          }
        }
      }
      response '200', 'show' do
        examples 'application/json' => {
          'user' => {
            'id' => 'integer',

            'created_at' => 'datetime',

            'updated_at' => 'datetime',

            'email' => 'string',

            'posts' =>
  [
    {

      'id' => 'integer',

      'created_at' => 'datetime',

      'updated_at' => 'datetime',

      'title' => 'string',

      'content' => 'string',

      'user_id' => 'foreign_key'

    }
  ],

            'roles' => 'enum_type',

            'comments' =>
  [
    {

      'id' => 'integer',

      'created_at' => 'datetime',

      'updated_at' => 'datetime',

      'content' => 'string',

      'user_id' => 'foreign_key'

    }
  ],

            'likes' =>
  [
    {

      'id' => 'integer',

      'created_at' => 'datetime',

      'updated_at' => 'datetime',

      'user_id' => 'foreign_key'

    }
  ]

          },

          'message' => {}

        }

        let(:resource) { create(:user) }

        let(:params) {}

        let(:id) { resource.id }

        run_test! do |response|
          expect(response.status).to eq(200)
        end
      end
    end
  end

  path '//api/users' do
    post 'Create users' do
      tags 'users'
      consumes 'application/json'
      parameter name: :params, in: :body, schema: {
        type: :object,
        properties: {
          users: {
            type: :object,
            properties: {
              email: {
                type: :string,
                example: 'string'
              },

              roles: {
                type: :enum_type,
                example: 'enum_type'
              }

            }
          }
        }
      }
      response '200', 'create' do
        examples 'application/json' => {
          'user' => {
            'id' => 'integer',

            'created_at' => 'datetime',

            'updated_at' => 'datetime',

            'email' => 'string',

            'posts' =>
  [
    {

      'id' => 'integer',

      'created_at' => 'datetime',

      'updated_at' => 'datetime',

      'title' => 'string',

      'content' => 'string',

      'user_id' => 'foreign_key'

    }
  ],

            'roles' => 'enum_type',

            'comments' =>
  [
    {

      'id' => 'integer',

      'created_at' => 'datetime',

      'updated_at' => 'datetime',

      'content' => 'string',

      'user_id' => 'foreign_key'

    }
  ],

            'likes' =>
  [
    {

      'id' => 'integer',

      'created_at' => 'datetime',

      'updated_at' => 'datetime',

      'user_id' => 'foreign_key'

    }
  ]

          },

          'error_object' => {}

        }

        let(:resource) { build(:user) }

        let(:params) { { users: resource.attributes.to_hash } }

        run_test! do |response|
          expect(response.status).to eq(200)
        end
      end
    end
  end

  path '/api/users' do
    get 'List users' do
      tags 'users'
      consumes 'application/json'
      parameter name: :params, in: :query, schema: {
        type: :object,
        properties: {
          pagination_page: {
            type: :pagination_page,
            example: 'pagination_page'
          },
          pagination_limit: {
            type: :pagination_limit,
            example: 'pagination_limit'
          },
          users: {
            type: :object,
            properties: {
              email: {
                type: :string,
                example: 'string'
              },

              roles: {
                type: :enum_type,
                example: 'enum_type'
              }

            }
          }
        }
      }
      response '200', 'index' do
        examples 'application/json' => {
          'total_pages' => 'integer',

          'users' =>
        [
          {

            'id' => 'integer',

            'created_at' => 'datetime',

            'updated_at' => 'datetime',

            'email' => 'string',

            'posts' =>
        [
          {

            'id' => 'integer',

            'created_at' => 'datetime',

            'updated_at' => 'datetime',

            'title' => 'string',

            'content' => 'string',

            'user_id' => 'foreign_key'

          }
        ],

            'roles' => 'enum_type',

            'comments' =>
        [
          {

            'id' => 'integer',

            'created_at' => 'datetime',

            'updated_at' => 'datetime',

            'content' => 'string',

            'user_id' => 'foreign_key'

          }
        ],

            'likes' =>
        [
          {

            'id' => 'integer',

            'created_at' => 'datetime',

            'updated_at' => 'datetime',

            'user_id' => 'foreign_key'

          }
        ]

          }
        ],

          'message' => {}

        }

        let(:resource) { create(:user) }

        let(:params) {}
        run_test! do |response|
          expect(response.status).to eq(200)
        end
      end
    end
  end
end

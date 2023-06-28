require 'swagger_helper'

RSpec.describe 'api/comments', type: :request do
  before do
    create(:comment)
  end

  # jitera-hook-for-rswag-example

  path '/api/comments/{id}' do
    put 'Update comments' do
      tags 'comments'
      consumes 'application/json'
      parameter name: 'id', in: :path, type: 'string', description: 'id'
      parameter name: :params, in: :body, schema: {
        type: :object,
        properties: {
          comments: {
            type: :object,
            properties: {
              content: {
                type: :string,
                example: 'string'
              },

              user_id: {
                type: :foreign_key,
                example: 'foreign_key'
              },

              post_id: {
                type: :foreign_key,
                example: 'foreign_key'
              }

            }
          }
        }
      }
      response '200', 'update' do
        examples 'application/json' => {
          'comment' => {
            'id' => 'integer',

            'created_at' => 'datetime',

            'updated_at' => 'datetime',

            'content' => 'string',

            'user' => {
              'id' => 'integer',

              'created_at' => 'datetime',

              'updated_at' => 'datetime',

              'email' => 'string',

              'roles' => 'enum_type'

            },

            'user_id' => 'foreign_key',

            'post' => {
              'id' => 'integer',

              'created_at' => 'datetime',

              'updated_at' => 'datetime',

              'title' => 'string',

              'content' => 'string',

              'user_id' => 'foreign_key'

            },

            'post_id' => 'foreign_key'

          },

          'error_object' => {}

        }

        let(:resource) { create(:comment) }

        let(:id) { resource.id }

        let(:params) { { id: id, comments: { id: id } } }

        run_test! do |response|
          expect(response.status).to eq(200)
        end
      end
    end
  end

  path '/api/comments/{id}' do
    get 'Show comments' do
      tags 'comments'
      consumes 'application/json'
      parameter name: 'id', in: :path, type: 'string', description: 'id'
      parameter name: :params, in: :body, schema: {
        type: :object,
        properties: {
        }
      }
      response '200', 'show' do
        examples 'application/json' => {
          'comment' => {
            'id' => 'integer',

            'created_at' => 'datetime',

            'updated_at' => 'datetime',

            'content' => 'string',

            'user' => {
              'id' => 'integer',

              'created_at' => 'datetime',

              'updated_at' => 'datetime',

              'email' => 'string',

              'roles' => 'enum_type'

            },

            'user_id' => 'foreign_key',

            'post' => {
              'id' => 'integer',

              'created_at' => 'datetime',

              'updated_at' => 'datetime',

              'title' => 'string',

              'content' => 'string',

              'user_id' => 'foreign_key'

            },

            'post_id' => 'foreign_key'

          },

          'message' => {}

        }

        let(:resource) { create(:comment) }

        let(:params) {}

        let(:id) { resource.id }

        run_test! do |response|
          expect(response.status).to eq(200)
        end
      end
    end
  end

  path '//api/comments' do
    post 'Create comments' do
      tags 'comments'
      consumes 'application/json'
      parameter name: :params, in: :body, schema: {
        type: :object,
        properties: {
          comments: {
            type: :object,
            properties: {
              content: {
                type: :string,
                example: 'string'
              },

              user_id: {
                type: :foreign_key,
                example: 'foreign_key'
              },

              post_id: {
                type: :foreign_key,
                example: 'foreign_key'
              }

            }
          }
        }
      }
      response '200', 'create' do
        examples 'application/json' => {
          'comment' => {
            'id' => 'integer',

            'created_at' => 'datetime',

            'updated_at' => 'datetime',

            'content' => 'string',

            'user' => {
              'id' => 'integer',

              'created_at' => 'datetime',

              'updated_at' => 'datetime',

              'email' => 'string',

              'roles' => 'enum_type'

            },

            'user_id' => 'foreign_key',

            'post' => {
              'id' => 'integer',

              'created_at' => 'datetime',

              'updated_at' => 'datetime',

              'title' => 'string',

              'content' => 'string',

              'user_id' => 'foreign_key'

            },

            'post_id' => 'foreign_key'

          },

          'error_object' => {}

        }

        let(:resource) { build(:comment) }

        let(:params) { { comments: resource.attributes.to_hash } }

        run_test! do |response|
          expect(response.status).to eq(200)
        end
      end
    end
  end

  path '/api/comments' do
    get 'List comments' do
      tags 'comments'
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
          comments: {
            type: :object,
            properties: {
              content: {
                type: :string,
                example: 'string'
              },

              user_id: {
                type: :foreign_key,
                example: 'foreign_key'
              },

              post_id: {
                type: :foreign_key,
                example: 'foreign_key'
              }

            }
          }
        }
      }
      response '200', 'index' do
        examples 'application/json' => {
          'total_pages' => 'integer',

          'comments' =>
        [
          {

            'id' => 'integer',

            'created_at' => 'datetime',

            'updated_at' => 'datetime',

            'content' => 'string',

            'user' => {
              'id' => 'integer',

              'created_at' => 'datetime',

              'updated_at' => 'datetime',

              'email' => 'string',

              'roles' => 'enum_type'

            },

            'user_id' => 'foreign_key',

            'post' => {
              'id' => 'integer',

              'created_at' => 'datetime',

              'updated_at' => 'datetime',

              'title' => 'string',

              'content' => 'string',

              'user_id' => 'foreign_key'

            },

            'post_id' => 'foreign_key'

          }
        ],

          'message' => {}

        }

        let(:resource) { create(:comment) }

        let(:params) {}
        run_test! do |response|
          expect(response.status).to eq(200)
        end
      end
    end
  end
end

require 'swagger_helper'

RSpec.describe 'api/posts', type: :request do
  before do
    create(:post)
  end

  # jitera-hook-for-rswag-example

  path '/api/posts/{id}' do
    delete 'Destroy posts' do
      tags 'posts'
      consumes 'application/json'
      parameter name: 'id', in: :path, type: 'string', description: 'id'
      parameter name: :params, in: :body, schema: {
        type: :object,
        properties: {
        }
      }
      response '200', 'delete' do
        examples 'application/json' => {
          'message' => {}

        }

        let(:resource) { create(:post) }

        let(:params) {}

        let(:id) { resource.id }

        run_test! do |response|
          expect(response.status).to eq(200)
        end
      end
    end
  end

  path '/api/posts/{id}' do
    put 'Update posts' do
      tags 'posts'
      consumes 'application/json'
      parameter name: 'id', in: :path, type: 'string', description: 'id'
      parameter name: :params, in: :body, schema: {
        type: :object,
        properties: {
          posts: {
            type: :object,
            properties: {
              title: {
                type: :string,
                example: 'string'
              },

              content: {
                type: :string,
                example: 'string'
              },

              user_id: {
                type: :foreign_key,
                example: 'foreign_key'
              },

              status: {
                type: :enum_type,
                example: 'enum_type'
              }

            }
          }
        }
      }
      response '200', 'update' do
        examples 'application/json' => {
          'post' => {
            'id' => 'integer',

            'created_at' => 'datetime',

            'updated_at' => 'datetime',

            'title' => 'string',

            'content' => 'string',

            'user' => {
              'id' => 'integer',

              'created_at' => 'datetime',

              'updated_at' => 'datetime',

              'email' => 'string'

            },

            'user_id' => 'foreign_key',

            'comments' =>
  [
    {

      'id' => 'integer',

      'created_at' => 'datetime',

      'updated_at' => 'datetime',

      'content' => 'string',

      'user_id' => 'foreign_key',

      'post_id' => 'foreign_key'

    }
  ],

            'likes' =>
  [
    {

      'id' => 'integer',

      'created_at' => 'datetime',

      'updated_at' => 'datetime',

      'user_id' => 'foreign_key',

      'post_id' => 'foreign_key'

    }
  ],

            'posttaggings' =>
  [
    {

      'id' => 'integer',

      'created_at' => 'datetime',

      'updated_at' => 'datetime',

      'post_id' => 'foreign_key'

    }
  ],

            'status' => 'enum_type'

          },

          'error_object' => {}

        }

        let(:resource) { create(:post) }

        let(:id) { resource.id }

        let(:params) { { id: id, posts: { id: id } } }

        run_test! do |response|
          expect(response.status).to eq(200)
        end
      end
    end
  end

  path '/api/posts/{id}' do
    get 'Show posts' do
      tags 'posts'
      consumes 'application/json'
      parameter name: 'id', in: :path, type: 'string', description: 'id'
      parameter name: :params, in: :body, schema: {
        type: :object,
        properties: {
        }
      }
      response '200', 'show' do
        examples 'application/json' => {
          'post' => {
            'id' => 'integer',

            'created_at' => 'datetime',

            'updated_at' => 'datetime',

            'title' => 'string',

            'content' => 'string',

            'user' => {
              'id' => 'integer',

              'created_at' => 'datetime',

              'updated_at' => 'datetime',

              'email' => 'string'

            },

            'user_id' => 'foreign_key',

            'comments' =>
  [
    {

      'id' => 'integer',

      'created_at' => 'datetime',

      'updated_at' => 'datetime',

      'content' => 'string',

      'user_id' => 'foreign_key',

      'post_id' => 'foreign_key'

    }
  ],

            'likes' =>
  [
    {

      'id' => 'integer',

      'created_at' => 'datetime',

      'updated_at' => 'datetime',

      'user_id' => 'foreign_key',

      'post_id' => 'foreign_key'

    }
  ],

            'posttaggings' =>
  [
    {

      'id' => 'integer',

      'created_at' => 'datetime',

      'updated_at' => 'datetime',

      'post_id' => 'foreign_key'

    }
  ],

            'status' => 'enum_type'

          },

          'message' => {}

        }

        let(:resource) { create(:post) }

        let(:params) {}

        let(:id) { resource.id }

        run_test! do |response|
          expect(response.status).to eq(200)
        end
      end
    end
  end

  path '//api/posts' do
    post 'Create posts' do
      tags 'posts'
      consumes 'application/json'
      parameter name: :params, in: :body, schema: {
        type: :object,
        properties: {
          posts: {
            type: :object,
            properties: {
              title: {
                type: :string,
                example: 'string'
              },

              content: {
                type: :string,
                example: 'string'
              },

              user_id: {
                type: :foreign_key,
                example: 'foreign_key'
              },

              status: {
                type: :enum_type,
                example: 'enum_type'
              }

            }
          }
        }
      }
      response '200', 'create' do
        examples 'application/json' => {
          'post' => {
            'id' => 'integer',

            'created_at' => 'datetime',

            'updated_at' => 'datetime',

            'title' => 'string',

            'content' => 'string',

            'user' => {
              'id' => 'integer',

              'created_at' => 'datetime',

              'updated_at' => 'datetime',

              'email' => 'string'

            },

            'user_id' => 'foreign_key',

            'comments' =>
  [
    {

      'id' => 'integer',

      'created_at' => 'datetime',

      'updated_at' => 'datetime',

      'content' => 'string',

      'user_id' => 'foreign_key',

      'post_id' => 'foreign_key'

    }
  ],

            'likes' =>
  [
    {

      'id' => 'integer',

      'created_at' => 'datetime',

      'updated_at' => 'datetime',

      'user_id' => 'foreign_key',

      'post_id' => 'foreign_key'

    }
  ],

            'posttaggings' =>
  [
    {

      'id' => 'integer',

      'created_at' => 'datetime',

      'updated_at' => 'datetime',

      'post_id' => 'foreign_key'

    }
  ],

            'status' => 'enum_type'

          },

          'error_object' => {}

        }

        let(:resource) { build(:post) }

        let(:params) { { posts: resource.attributes.to_hash } }

        run_test! do |response|
          expect(response.status).to eq(200)
        end
      end
    end
  end

  path '/api/posts' do
    get 'List posts' do
      tags 'posts'
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
          posts: {
            type: :object,
            properties: {
              title: {
                type: :string,
                example: 'string'
              },

              content: {
                type: :string,
                example: 'string'
              },

              user_id: {
                type: :foreign_key,
                example: 'foreign_key'
              },

              status: {
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

          'posts' =>
        [
          {

            'id' => 'integer',

            'created_at' => 'datetime',

            'updated_at' => 'datetime',

            'title' => 'string',

            'content' => 'string',

            'user' => {
              'id' => 'integer',

              'created_at' => 'datetime',

              'updated_at' => 'datetime',

              'email' => 'string'

            },

            'user_id' => 'foreign_key',

            'comments' =>
        [
          {

            'id' => 'integer',

            'created_at' => 'datetime',

            'updated_at' => 'datetime',

            'content' => 'string',

            'user_id' => 'foreign_key',

            'post_id' => 'foreign_key'

          }
        ],

            'likes' =>
        [
          {

            'id' => 'integer',

            'created_at' => 'datetime',

            'updated_at' => 'datetime',

            'user_id' => 'foreign_key',

            'post_id' => 'foreign_key'

          }
        ],

            'posttaggings' =>
        [
          {

            'id' => 'integer',

            'created_at' => 'datetime',

            'updated_at' => 'datetime',

            'post_id' => 'foreign_key'

          }
        ],

            'status' => 'enum_type'

          }
        ],

          'message' => {}

        }

        let(:resource) { create(:post) }

        let(:params) {}
        run_test! do |response|
          expect(response.status).to eq(200)
        end
      end
    end
  end
end

# rubocop:disable Style/ClassAndModuleChildren
class PostsService::Index
  attr_accessor :params, :records, :query

  def initialize(input_params, _current_user = nil)
    @params = input_params

    @records = Post

    @query = records
  end

  def execute
    posts_title_start_with_like # find posts by title

    # posts_content_start_with_like

    posts_user_id_equal

    # posts_status_equal
    order
    paginate

    records
  end

  # find posts by title
  def posts_title_start_with_like
    
    return if params.dig(:posts, :title).blank?

    @records = Post.where('posts.title LIKE ? AND posts.status = ?', "%#{params.dig(:posts, :title)}%", 1)
  end

  # def posts_content_start_with_like
  #   return if params.dig(:posts, :content).blank?

  #   where_clause = query.where("posts.content like ?", "%#{params.dig(:posts, :content)}")

  #   # Notes - The reason for doing this is as below
  #   # If suppose there is OR condition, and previous 1 filter is nil, params, not present?
  #   # in such case there will be records.or(second_condition)
  #   # OR will return all records and break logic
  #   # ideally if previous condition nil it should retrun with current second condition and not perform OR
  #   @records = if records.is_a?(Class) # return true if record is class
  #       where_clause
  #     else
  #       records.or(query)
  #     end
  # end

  def posts_user_id_equal
    return if params.dig(:posts, :user_id).blank?

    where_clause = query.where(posts: { user_id: params.dig(:posts, :user_id).to_s })

    # Notes - The reason for doing this is as below
    # If suppose there is OR condition, and previous 1 filter is nil, params, not present?
    # in such case there will be records.or(second_condition)
    # OR will return all records and break logic
    # ideally if previous condition nil it should retrun with current second condition and not perform OR
    @records = if records.is_a?(Class)
        where_clause
      else
        records.or(query)
      end
  end

  # def posts_status_equal
  #   return if params.dig(:posts, :status).blank?

  #   where_clause = query.where(posts: { status: params.dig(:posts, :status).to_s })

  #   # Notes - The reason for doing this is as below
  #   # If suppose there is OR condition, and previous 1 filter is nil, params, not present?
  #   # in such case there will be records.or(second_condition)
  #   # OR will return all records and break logic
  #   # ideally if previous condition nil it should retrun with current second condition and not perform OR
  #   @records = if records.is_a?(Class)
  #       where_clause
  #     else
  #       records.or(query)
  #     end
  # end

  def order
    @records = records.order("posts.created_at desc")
  end

  def paginate
    @records = records.page(params[:pagination_page] || 1).per(params[:pagination_limit] || 20)
  end
end

# rubocop:enable Style/ClassAndModuleChildren

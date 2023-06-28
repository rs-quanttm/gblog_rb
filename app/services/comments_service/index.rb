# rubocop:disable Style/ClassAndModuleChildren
class CommentsService::Index
  attr_accessor :params, :records, :query

  def initialize(params, _current_user = nil)
    @params = params

    @records = Comment

    @query = records
  end

  def execute
    comments_content_start_with_like

    comments_user_id_equal

    comments_post_id_equal

    order
    paginate

    records
  end

  def comments_content_start_with_like
    return if params.dig(:comments, :content).blank?

    where_clause = query.where('comments.content like ?', "%#{params.dig(:comments, :content)}")

    @records = where_clause
  end

  def comments_user_id_equal
    return if params.dig(:comments, :user_id).blank?

    where_clause = query.where(comments: { user_id: params.dig(:comments, :user_id).to_s })

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

  def comments_post_id_equal
    return if params.dig(:comments, :post_id).blank?

    where_clause = query.where(comments: { post_id: params.dig(:comments, :post_id).to_s })

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

  def order
    @records = records.order('comments.created_at desc')
  end

  def paginate
    @records = records.page(params[:pagination_page] || 1).per(params[:pagination_limit] || 20)
  end
end
# rubocop:enable Style/ClassAndModuleChildren

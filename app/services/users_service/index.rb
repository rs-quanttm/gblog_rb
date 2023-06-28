# rubocop:disable Style/ClassAndModuleChildren
class UsersService::Index
  attr_accessor :params, :records, :query

  def initialize(params, _current_user = nil)
    @params = params

    @records = User

    @query = records
  end

  def execute
    users_email_start_with_like

    users_roles_equal

    order
    paginate

    records
  end

  def users_email_start_with_like
    return if params.dig(:users, :email).blank?

    where_clause = query.where('users.email like ?', "%#{params.dig(:users, :email)}")

    @records = where_clause
  end

  def users_roles_equal
    return if params.dig(:users, :roles).blank?

    where_clause = query.where(users: { roles: params.dig(:users, :roles).to_s })

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
    @records = records.order('users.created_at desc')
  end

  def paginate
    @records = records.page(params[:pagination_page] || 1).per(params[:pagination_limit] || 20)
  end
end
# rubocop:enable Style/ClassAndModuleChildren

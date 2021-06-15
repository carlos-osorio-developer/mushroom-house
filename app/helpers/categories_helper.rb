module CategoriesHelper
  def display_columns(row)
    @row = row
    render partial: row.even? ? 'articles/preview1' : 'articles/preview2'
  end

  def return_row
    @row
  end
end

module ArticlesHelper
  def has_seached?(search)
    search ? "Showing results for: '#{search}'" : "Please enter a search"
  end

  def search_results?(results)
    if !results
      @results = [] 
      'There are no results for this search.'
    elsif !results.any?
      'There are no results for this search.'
    end
  end
end

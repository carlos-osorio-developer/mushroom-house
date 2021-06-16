module ArticlesHelper
  def searched?(search)
    search ? "Showing results for: '#{search}'" : 'Please enter a search'
  end

  def search_results?(results)
    if !results
      @results = []
      'There are no results for this search.'
    elsif results.none?
      'There are no results for this search.'
    end
  end

  def new_or_edit(id)
    if id
      link_to 'Back', article_path(@article), class: 'btn btn-warning'
    else
      link_to 'Back', root_path, class: 'btn btn-warning'
    end
  end

  def add_line_breaks(text)
    simple_format(text)
  end
end

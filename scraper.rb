class Scraper
  def initialize(ingredient)
    @ingredient = ingredient
  end

  def scrape
    url = "http://www.letscookfrench.com/recipes/find-recipe.aspx?s=#{@ingredient}"

    html_file = open(url).read
    html_doc = Nokogiri::HTML(html_file)

    results = []

    html_doc.search('.m_contenu_resultat').take(5).each do |element|
      name = element.search('.m_titre_resultat').text.strip
      description = element.search('.m_texte_resultat').text.strip
      prep_time = element.search('.m_detail_time div:first-of-type').text.strip
      recipe = Recipe.new(name, description, prep_time)
      results << recipe
    end
    results
  end

end

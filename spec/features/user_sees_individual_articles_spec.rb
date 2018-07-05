require 'rails_helper'

describe 'User visits individual article page' do
  describe 'that they have accessed by link via the index page' do
    it 'displays the information for one article' do
      article = Article.create!(title: "New Title", body: "New Body")

      visit articles_path

      click_link article.title

      expect(page).to have_content(article.title)
      expect(page).to have_content(article.body)
    end
  end
end

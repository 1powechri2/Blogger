require "rails_helper"

describe "user edits an article" do
  describe "they link from the show page" do
    it "displays the article and edits it" do
      article_1 = Article.create!(title: "Title", body: "Body")

      visit article_path(article_1)

      click_link "Edit"

      expect(current_path).to eq(edit_article_path(article_1))
      expect(page).to have_content(article_1.title)

      fill_in :article_title, with: 'Yass Queen'
      fill_in :article_body, with: 'Slay!'

      click_on 'Update Article'

      expect(current_path).to eq(articles_path)

      expect(page).to have_content('Your Article has Been Updated')
      expect(page).to have_content('Yass Queen')
    end
  end
end

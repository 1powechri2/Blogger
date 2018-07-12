require 'rails_helper'

describe 'User visits individual article page' do
  describe 'that they have accessed by link via the index page' do
    it 'displays the information for one article' do
      article = Article.create(title: "New Title", body: "New Body")

      visit articles_path

      click_link article.title

      expect(page).to have_content(article.title)
      expect(page).to have_content(article.body)
    end
  end
  describe 'the user views an individual article' do
    it 'sees all comments associated with that article' do
      article = Article.create(title: "New Title", body: "New Body")
      comment_one = article.comments.create(author: 'Dudeguy', body: 'Is a RudeGuy')
      comment_two = article.comments.create(author: 'ManSlave', body: 'Is a Rave')

      visit article_path(article)

      expect(page).to have_content(article.title)
      expect(page).to have_content(article.body)
      expect(page).to have_content(comment_one.author)
      expect(page).to have_content(comment_one.body)
      expect(page).to have_content(comment_one.author)
      expect(page).to have_content(comment_one.body)
    end
  end
  describe "they fill in a comment form" do
    it "displays the comment on the article show" do
      article = Article.create!(title: "New Title", body: "New Body")

      visit article_path(article)

      fill_in :comment_author, with: "Shebeast"
      fill_in :comment_body, with: "Is Ready to Feast!"
      click_on "Submit"

      expect(current_path).to eq(article_path(article))
      expect(page).to have_content("Shebeast")
      expect(page).to have_content("Is Ready to Feast!")
    end
  end
end

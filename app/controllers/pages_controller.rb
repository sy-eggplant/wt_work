class PagesController < ApplicationController
  def top
    @posts = get_posts
    @categories = get_categries
  end
  private
    def get_posts
      uri = URI.escape("http://#{SITE_URL["wt_url"]}/wp-json/wp/v2/posts")
      json = open(uri)
      JSON.parse(json.read)
    end

    def get_categries
      uri = URI.escape("http://#{SITE_URL["wt_url"]}/wp-json/wp/v2/categories")
      json = open(uri)
      JSON.parse(json.read)
    end
end

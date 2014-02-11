module ApplicationHelper
  require 'redcarpet'

  def document_title
    @document_title || '素数レーダー'
  end

  def markdown(text)
    markdown = Redcarpet::Markdown.new(Redcarpet::Render::HTML,
                                      :autolink => true,
                                      :space_after_headers => true)
    markdown.render(text).html_safe
  end

end

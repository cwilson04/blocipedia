module ApplicationHelper
  def markdown(body)
    renderer = Redcarpet::Render::HTML.new(hard_wrap: true, filter_html: true)
    options = {
      autolink: true,
      no_intra_emphasis: true,
      disable_indented_code_blocks: true,
      fenced_code_blocks: true,
      lax_html_code_blocks: true,
      strikethrough: true,
      superscript: true,
    }
    Redcarpet::Markdown.new(renderer, options).render(body).html_safe
  end
  
end

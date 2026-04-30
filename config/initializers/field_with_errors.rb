ActionView::Base.field_error_proc = Proc.new do |html_tag, instance|
  if html_tag =~ /<(input|textarea|select)/
    html_tag.sub(/class="/, 'class="is-invalid ').html_safe
  else
    html_tag.html_safe
  end
end
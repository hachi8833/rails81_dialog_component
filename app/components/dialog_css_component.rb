class DialogCssComponent < ViewComponent::Base
  renders_one :title
  renders_one :description
  renders_one :body
  renders_one :footer

  def initialize(
    id:,
    confirm_text: "確認",
    cancel_text: "キャンセル",
    confirm_form: nil,
    closedby: "any",
    show_close_button: true,
    **options
  )
    @id = id
    @confirm_text = confirm_text
    @cancel_text = cancel_text
    @confirm_form = confirm_form
    @closedby = closedby
    @show_close_button = show_close_button
    @options = options
  end

  private

  attr_reader :id, :confirm_text, :cancel_text, :confirm_form, :closedby, :show_close_button, :options

  def title_id
    "#{id}-title"
  end

  def description_id
    "#{id}-desc"
  end

  def form_method
    confirm_form.present? ? :post : :dialog
  end

  def form_url
    confirm_form || "#"
  end

  def form_options
    {
      method: form_method,
      url: form_url,
      data: { turbo: false }
    }
  end
end

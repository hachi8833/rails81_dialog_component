class DemosController < ApplicationController
  def index
  end

  def create
    redirect_to demos_index_path, notice: "フォームが送信されました！"
  end
end

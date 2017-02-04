class DocsController < ApplicationController
  before_action :doc_find, only: [:edit, :update, :destroy]
  def index
    @docs=Doc.all
  end
  def new
    @doc=Doc.new
  end
  def create
    Doc.create(doc_params)
    redirect_to docs_path
  end
  def edit
  end
  def update
    @doc.update(doc_params)
    redirect_to docs_path
  end
  def destroy
    @doc.destroy
    redirect_to docs_path
  end
  private
  def doc_params
    params.require(:doc).permit(:title, :document)
  end
  def doc_find
    @doc=Doc.find(params[:id])
  end
end

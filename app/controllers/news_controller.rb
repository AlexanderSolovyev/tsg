class NewsController<ApplicationController
  def index
    @news=New.all.order(created_at: :desc)
  end
end

class WorksController < ApplicationController
  def index
    @works = Work.all
  end

  def new
    if params[:back]
      @work= Work.new(works_params)
    else
      @work = Work.new
    end
  end

  def create
    @work = Work.new(works_params)
    if @work.save
      # 一覧画面へ遷移して"ブレシピを作成しました！"とメッセージを表示します。
      redirect_to works_path, notice: "作品レシピを作成しました！"
    else
      # 入力フォームを再描画します。
      render 'new'
    end
  end

  def edit
   @work = Work.find(params[:id])
  end

  def update
    @work = Work.find(params[:id])
    @work.update(works_params)
    redirect_to works_path
  end

  def destroy
    @work = Work.find(params[:id])
    @work.destroy
    redirect_to works_path
  end

  def confirm
    @work = Work.new(works_params)
     render :new if @work.invalid?
  end

  private
    def works_params
      params.require(:work).permit(:title, :material, :production1, :production2, :production3)
    end

    def set_blog
      @work = Work.find(params[:id])
    end
end

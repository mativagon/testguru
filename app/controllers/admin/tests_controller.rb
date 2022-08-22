class Admin::TestsController < Admin::BaseController
  before_action :set_test, only: %i[show start destroy update edit]

  def new
    @test = Test.new
  end

  def update
    if @test.update(test_params)
      redirect_to test_path(@test)
    else
      render :edit
    end
  end

  def destroy
    @test.destroy
    redirect_to tests_path
  end

  def create
    @test = current_user.author_tests.new(test_params)

    if @test.save
      redirect_to test_path(@test)
    else
      render :new
    end
  end

  def index
    @tests = Test.all
  end

  def start
    current_user.tests.push(@test)
    redirect_to current_user.test_passage(@test)
  end

  private

  def set_test
    @test = Test.find(params[:id])
  end

  def test_params
    params.require(:test).permit(:title, :level, :category_id, :author_id)
  end
end

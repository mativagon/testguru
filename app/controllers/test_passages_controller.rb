class TestPassagesController < ApplicationController
  before_action :set_test_passage, only: %i[show update result gist]

  def show

  end

  def result

  end

  def update
    @test_passage.accept!(params[:answer_ids])

    if @test_passage.completed?
      TestsMailer.completed_test(@test_passage).deliver_now
      redirect_to result_test_passage_path(@test_passage)
    else
      render :show
    end
  end

  def gist
    client = Octokit::Client.new(access_token: ENV.fetch('GITHUB_TOKEN', nil))
    service = GistQuestionService.new(@test_passage.current_question, client)
    result = service.call
    gist_url = result.html_url

    flash_options = service.success? ? { notice: t('.success', link: result.html_url) } : { danger: t('.failed') }

    save_gist(gist_url)

    redirect_to @test_passage, flash_options
  end

  private

  def set_test_passage
    @test_passage = TestPassage.find(params[:id])
  end

  def save_gist(gist_url)
    @test_passage.current_question.gists.create(
      user_id: @test_passage.user.id,
      url: gist_url
    )
  end
end

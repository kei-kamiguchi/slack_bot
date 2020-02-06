class ChatbotsController < ApplicationController
  before_action :set_chatbot, only: [:show, :edit, :update, :destroy]
  # GET /chatbots
  # GET /chatbots.json
  def index
    @chatbots = Chatbot.all
  end

  # GET /chatbots/1
  # GET /chatbots/1.json
  def show
  end

  # GET /chatbots/new
  def new
    @chatbot = Chatbot.new
  end

  # GET /chatbots/1/edit
  def edit
  end

  # POST /chatbots
  # POST /chatbots.json
  def create
    @chatbot = Chatbot.new(chatbot_params)

    respond_to do |format|
      if @chatbot.save
        notifier = Slack::Notifier.new('https://hooks.slack.com/services/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')
        notifier.ping('Hello')
        format.html { redirect_to @chatbot, notice: 'Chatbot was successfully created.' }
        format.json { render :show, status: :created, location: @chatbot }
      else
        format.html { render :new }
        format.json { render json: @chatbot.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /chatbots/1
  # PATCH/PUT /chatbots/1.json
  def update
    respond_to do |format|
      if @chatbot.update(chatbot_params)
        format.html { redirect_to @chatbot, notice: 'Chatbot was successfully updated.' }
        format.json { render :show, status: :ok, location: @chatbot }
      else
        format.html { render :edit }
        format.json { render json: @chatbot.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /chatbots/1
  # DELETE /chatbots/1.json
  def destroy
    @chatbot.destroy
    respond_to do |format|
      format.html { redirect_to chatbots_url, notice: 'Chatbot was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_chatbot
      @chatbot = Chatbot.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def chatbot_params
      params.require(:chatbot).permit(:name, :message)
    end
end

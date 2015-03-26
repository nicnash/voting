class VotesController < ApplicationController
  before_action :set_vote, only: [:show, :edit, :update, :destroy]
 skip_before_action :verify_authenticity_token

  def vote
    byebug
  end

  # GET /votes
  # GET /votes.json
  def index
    @votes = Vote.all
  end

  # GET /votes/1
  # GET /votes/1.json
  def show
  end



  # GET /votes/new/value
  def new
    # @vote = Vote.new(user_id: current_user.id, idea_id: params[:id])
    
    puts "hellooooo"
    voteValue = params[:value];
    @voteExists = Vote.exists?(user_id: current_user.id, idea_id: params[:id])
    if @voteExists
      puts "YEA BABY IT EXISTS"  
      puts voteValue
      # if voteValue == "0"
      #   puts "EQUALS 0"
        @vote = Vote.where(user_id: current_user.id, idea_id: params[:id])
        # puts @vote
        @vote.destroy_all 
      # end
      # puts "after"

# @vote = Item.find(params[:id][:value])
    else
      # puts "WHATS WRONG WIT U BRO"
      @vote = Vote.new(user_id: current_user.id, idea_id: params[:id])
      @vote.save

    end
    
    # @vote.save
    redirect_to ideas_url
  end

  # def devote  vote = Vote.find_by(user_id: current_user.id, idea_id: params[:id])

  # GET /votes/1/edit
  def edit
  end

  # POST /votes
  # POST /votes.json
  def create
    @vote = Vote.new(vote_params)

    respond_to do |format|
      if @vote.save
        # format.html { redirect_to @vote, notice: 'Vote was successfully created.' }
        format.json { render :show, status: :created, location: @vote }
      else
        # format.html { render :new }
        format.json { render json: @vote.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /votes/1
  # PATCH/PUT /votes/1.json
  def update
    respond_to do |format|
      if @vote.update(vote_params)
        format.html { redirect_to @vote, notice: 'Vote was successfully updated.' }
        format.json { render :show, status: :ok, location: @vote }
      else
        format.html { render :edit }
        format.json { render json: @vote.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /votes/1
  # DELETE /votes/1.json
  def destroy
    @vote.destroy
    respond_to do |format|
      format.html { redirect_to votes_url, notice: 'Vote was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_vote
      @vote = Vote.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def vote_params
      params.permit(:user_id, :idea_id).merge(user_id: current_user.id)
    end
end

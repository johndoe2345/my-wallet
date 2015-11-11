class DebitCardsController < ApplicationController

  def index
    
  end

  def new
    @card = DebitCard.new
  end

  def edit
    @card = DebitCard.find(params[:id])
  end

  def show
    @card = DebitCard.find(params[:id])
  end

  def create
    @card = DebitCard.new(debit_card_params.merge(card_owner_id: current_user.id))
    if @card.save
      # this line below is what associates new card with current user
      current_user.debit_cards << @card
      redirect_to user_path(current_user.id), notice: "New card added."
    else
      flash[:alert] = "Something went wrong."
      render :new
    end
  end

  def update
    @card = DebitCard.find(params[:id])
    if @card.update(debit_card_params)
      redirect_to root_path, notice: "Card successfully updated."
    else
      flash[:alert] = "Something went wrong."
      render :edit
    end
  end

  def share
    @card = DebitCard.find(params[:id])
    @shared_user = User.find_by(email: params[:email])
    if !@shared_user.has_card?(@card.id)
      @shared_user.debit_cards << @card
      flash[:notice] = "Card successfully shared with #{@shared_user.full_name}."
      render :show
    else
      flash[:alert] = "Cannot complete request. You are already sharing this card with #{@shared_user.full_name}."
      render :show
    end
  end

  # removes the association of a card id from a user
  def remove
    UserCard.where(user_id: current_user.id, debit_card_id: params[:id]).first.destroy
    redirect_to root_path, notice: "Card removed."
  end

  def destroy
    @card = DebitCard.find(params[:id])
    if @card.destroy
      redirect_to root_path, notice: "Card deleted."
    else
      flash[:alert] = "Something went wrong."
      render :edit
    end
  end

  private

  def debit_card_params
    params.require(:debit_card).permit(:card_num, :card_type, :exp_mon, :exp_year, :balance)
  end

end

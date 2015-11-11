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
    @card = DebitCard.new(debit_card_params.merge(user_id: current_user.id))
    if @card.save
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
    params.require(:debit_card).permit(:user_id, :card_num, :card_type, :exp_mon, :exp_year, :balance)
  end

end

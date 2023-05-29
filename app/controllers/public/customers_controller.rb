class Public::CustomersController < ApplicationController

  before_action :authenticate_customer!
  before_action :guest_email_update, only: :update
  before_action :guest_email_withdraw, only: :withdraw

  def show
    @customer = current_customer
  end

  def edit
    @customer = current_customer
  end

  def update
    @customer = current_customer
    if @customer.update(customer_params)
      redirect_to customers_my_page_path, notice: "更新しました"
    else
      flash.now[:alert] = "更新に失敗しました"
      render :edit
    end
  end

  def withdraw
    customer = current_customer
    customer.update(is_deleted: true)
    reset_session
    redirect_to root_path, notice: "退会が完了しました。"
  end


  private

  def customer_params
    params.require(:customer).permit(:name, :email)
  end

  def guest_email_update
    customer = current_customer
    if customer.email == 'guest@example.com'
      redirect_to customers_my_page_path, alert: 'ゲストユーザーは編集できません。'
    end
  end

  def guest_email_withdraw
    customer = current_customer
    if customer.email == 'guest@example.com'
      redirect_to customers_my_page_path, alert: 'ゲストユーザーは削除できません。'
    end
  end


end

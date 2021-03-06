class ChargesController < ApplicationController


	def create
		@amount = 500000_00
		customer = Stripe::Customer.create(
			email: current_user.email,
			card: params[:stripeToken]
			)

		charge = Stripe::Charge.create(
			customer: customer.id,
			amount: @amount,
			description: "Blocipedia Membership - #{current_user.email}",
			currency: 'usd'
			)

		flash[:notice] = "Thanks for all the money, #{current_user.email}. Feel free to give us more!"
		redirect_to root_path
		current_user.member!

	rescue Stripe::CardError => e 
		flash[:error] = e.message
		redirect_to new_charge_path

	end

	def new
		@amount = 500000_00
   @stripe_btn_data = {
     key: "#{ Rails.configuration.stripe[:publishable_key] }",
     description: "BigMoney Membership - #{current_user.name}",
     amount: @amount
   }
 end


end

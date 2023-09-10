class User::Base < ApplicationController
    Stripe.api_key = ENV['STRIPE_SECRET_KEY']
    def check_user_signed_in?
        if !user_signed_in?
            redirect_to new_user_session_path
        end
    end
end
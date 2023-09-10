class ApplicationController < ActionController::Base
    
    #protect_from_forgery with: :exception
    # json でのリクエストの場合CSRFトークンの検証をスキップ
    skip_before_action :verify_authenticity_token,     if: -> {request.format.json?}
    # トークンによる認証
    before_action      :authenticate_user_from_token!, if: -> {params[:email].present?}

    def authenticate_user_from_token!
        resource.ensure_authentication_token if request.format.json?
        user = User.find_by(email: params[:email])
        if Devise.secure_compare(user.try(:authentication_token), params[:token])
          sign_in user, store: false
        end
    end
end

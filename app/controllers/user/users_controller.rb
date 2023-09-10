class User::UsersController < ApplicationController
    def serch
        puts "サーチ"
        name = params[:user][:name]
    end
end

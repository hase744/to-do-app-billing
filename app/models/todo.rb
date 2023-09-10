class Todo < ApplicationRecord
    attr_accessor :other_user_email
    before_validation :search_user
    belongs_to :user
    belongs_to :judger, class_name: 'User', foreign_key: :judger_id, optional:true
    def is_achieved?
        achieved_at.present?
    end

    def is_failed?
        failed_at.present?
    end

    def achieve_info
        if achieved_at.present?
            "成功！"
        elsif failed_at.present?
            "失敗"
        else
            "未達"
        end
    end

    def search_user
        if how_to_judge == 'other'
            user = User.find_by(email: other_user_email)
            if user.present?
                judger = user
            else
                errors.add(:other_user_email)
            end
        elsif how_to_judge != "me"
            puts "だめ"
            puts how_to_judge
            errors.add(:how_to_judge)
        end
    end
end

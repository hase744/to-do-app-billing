module User::TodosHelper
    def price_list
        hash = {}
        100.times do |n|
            hash.store("#{n*100}円","#{n*100}")
        end
        puts hash
        hash
    end
end

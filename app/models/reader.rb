class Reader < ActiveRecord::Base
    has_many :subscriptions
    has_many :magazines, through: :subscriptions

    def subscribe(magazine, price)
        Subscription.create(price: price, reader_id: self.id, magazine_id: magazine.id)
    end


    def total_subscription_price
        self.subscriptions.sum(:price)
    end

    def cancel_subscription(magazine)
        # find the subscription where the magazine id matches and destory it 
       s_instance = subcriptions.find_by(magazine_id: magazine.id)
       s_instance.destroy

    end 

end
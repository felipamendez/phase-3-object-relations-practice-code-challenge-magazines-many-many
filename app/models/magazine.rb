class Magazine < ActiveRecord::Base
    has_many :subscriptions
    has_many :readers, through: :subscriptions

  def email_list #map over the collection of readers of the mag, get their emails, joint them in a string
    emails = self.readers.map {|reader| reader.email}
    emails.join(";")
  end

    def self.most_popular #goes over all magazine instances, gets maximum magazine.subscriptions count and returns instance 
       self.all.max_by {|m| m.subscriptions.count}
    end

end
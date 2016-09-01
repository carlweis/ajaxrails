class Product < ActiveRecord::Base

  def self.search(search)
    if search
      where('name LIKE ? OR cost LIKE ? OR price LIKE ? OR quantity LIKE ? OR state LIKE ?', 
            "%#{search}%", "%#{search}%", "%#{search}%", "%#{search}%", "%#{search}%")
    else
      all
    end
  end
end

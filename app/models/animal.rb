class Animal < ActiveRecord::Base
before_save :default_food
  
  def default_food
   self.food ||= 10
 end 
  
 
  end 
  

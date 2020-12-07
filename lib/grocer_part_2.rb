require_relative './part_1_solution.rb'
require "pry"

def apply_coupons(cart, coupons)
  
  count = 0 
  while count < coupons.length
    cart_item = find_item_by_name_in_collection(coupons[count][:item], cart)
    coupon_item_name = "#{coupons[count][:item]} W/COUPON"
    cart_item_with_coup = find_item_by_name_in_collection(coupon_item_name, cart)
    if cart_item && cart_item[:count] >= coupons[count][:num]
        if cart_item_with_coup 
          cart_item_with_coup[:count] += coupons[count][:num]
          cart_item[:count] -= coupons[counter][:num]
        else
          cart_item_with_coup = {
            :item => coupon_item_name,
            :price => coupons[counter][:cost] / coupons[counter][:num],
            :clearance => cart_item[:clearance],
            :count => coupons[count][:num]
          }
          cart << cart_item_with_coup
          cart_item[:count] -= coupons[count][:num]
        end  
    end
    counter += 1
  end
end 
   



def apply_clearance(cart)
  # REMEMBER: This method **should** update cart
  cart.each do |item_hash|
    if item_hash[:clearance] == true
      item_hash[:price] = (item_hash[:price].to_f * 0.8).round(2)
    end
  end 

end

def checkout(cart, coupons)
  # Consult README for inputs and outputs
  #
  # This method should call
  # * consolidate_cart
  # * apply_coupons
  # * apply_clearance

  # BEFORE it begins the work of calculating the total (or else you might have
  # some irritated customers
  new_cart = consolidate_cart(cart)
  new_cart = apply_coupons(new_cart, coupons)
  new_cart = apply_clearance(new_cart)
 

  cart_total = 0
  new_cart.each do |item_hash|
    cart_total += item_hash[:price].to_f * item_hash[:count].to_f    
  end 
  
  if cart_total > 100
    cart_total = cart_total * 0.8
  end 
  
  cart_total
  
  
end
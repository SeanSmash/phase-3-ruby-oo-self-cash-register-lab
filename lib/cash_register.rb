require 'pry'

class CashRegister
    attr_accessor :discount, :total, :items, :prices

    def initialize(discount = 0)
        @discount = discount
        @total = 0
        @prices = []
        @items = []
    end

    def add_item(title, price, quantity = 1)
        quantity.times {@items << title}
        quantity.times {@prices << {price:price, quantity:quantity}}
        @total += price * quantity
    end

    def apply_discount
        if @discount > 0
            @total = (@total - @total * @discount.fdiv(100)).floor(0)
            return "After the discount, the total comes to $#{@total}."
        else
            return "There is no discount to apply."
        end
    end

    def void_last_transaction
        @total -= (@prices.last[:price] * @prices.last[:quantity])
        @prices.pop
    end
end

class Customer

    attr_reader :name
    attr_accessor :age

    @@all = []  

    def initialize(name, age)
        @name = name
        @age = age
        @@all << self
    end

    def self.all
        @@all
    end

    def new_meal(waiter, total, tip)
        Meal.new(@waiter = waiter, @customer = self, @total = total, @tip = tip)
    end

    def meals
        Meal.all.select { |meal| meal.customer == self }
    end

    def waiters
        self.meals.map { |meal| meal.waiter }.compact
    end

end
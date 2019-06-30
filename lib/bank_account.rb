class BankAccount
    attr_accessor :balance, :status
    attr_reader :name
    @@all = []

    def initialize(name)
        @name = name
        @balance = 1000
        @status = "open"
        @@all << self
    end

    def name
       @name
    end

    def deposit(amount)
        @balance += amount
    end

    def display_balance
        current_balance = @balance
        "Your balance is $#{current_balance}."
    end

    def valid?
        @balance > 0 && @status == "open" ? true : false
    end

    def close_account
        @status = "closed"
    end

end

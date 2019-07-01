require 'pry'
class Transfer

  attr_accessor :status, :amount
  attr_reader :sender, :receiver

  def initialize(sender, receiver, amount)
    @sender = sender
    @receiver = receiver
    @status = "pending"
    @amount = amount
  end

  def valid?
    @sender.valid? && @receiver.valid? && @sender.balance > @amount
  end

  def execute_transaction
    if self.valid? && @status == "pending"
      @sender.balance -= amount
      @receiver.balance += amount 
      @status = "complete"

      #if @sender.balance > @amount

      else
        @status = "rejected"
       "Transaction rejected. Please check your account balance."
      #binding.pry
    end
  end
  
    def reverse_transfer
      if @status == "complete"
      @sender.balance += @amount
      @receiver.balance -= @amount
      @status = "reversed"
    end
  end

end
#binding.pry
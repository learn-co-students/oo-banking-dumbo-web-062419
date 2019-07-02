class Transfer
  @@all = []
  attr_accessor :sender, :receiver, :amount
  attr_reader :status
  def initialize(sender,receiver,amount,status = "pending")
    @sender = sender
    @receiver = receiver
    @amount = amount
    @status = status
    @@all << self
  end

  def valid?
    if @sender.valid? && @receiver.valid?
    true
    end
end

def execute_transaction
  if @sender.balance > @amount && @status == 'pending'
    @sender.balance -= @amount
    @receiver.balance += @amount
    @status = "complete"
  else
    @status = "rejected"
    "Transaction rejected. Please check your account balance."
  end
end

def reverse_transfer
 if @status == "complete"
  @receiver.balance -= @amount
  @sender.balance += @amount
  @status = "reversed"
 end
end



end

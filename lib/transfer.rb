class Transfer

  attr_reader :sender, :receiver, :amount, :status
  @@all = []

  def initialize(sender, receiver, amount)
    @sender = sender
    @receiver = receiver
    @amount = amount
    @status = "pending"
    @@all << self
  end

  def valid?
    sender.valid? == true  &&  receiver.valid? == true  ? true : false
  end

  def execute_transaction
    if valid? && sender.balance > @amount && @status == "pending"
      receiver.balance += @amount
      sender.balance -= @amount
      @status = "complete"
    else
      reject_transfer
    end
  end

  def reverse_transfer
    if valid? && receiver.balance > @amount && @status == "complete"
      receiver.balance -= @amount
      sender.balance += @amount
      @status = "reversed"
    else
      reject_transfer
    end
  end

  def reject_transfer
    @status = "rejected"
    "Transaction rejected. Please check your account balance."
  end

end

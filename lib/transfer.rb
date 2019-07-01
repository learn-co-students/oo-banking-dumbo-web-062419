class Transfer
  # your code here
  attr_accessor :receiver, :amount, :status
  attr_reader :sender

  def initialize(sender, receiver, amount = 50)
    @receiver = receiver
    @sender = sender
    @amount = amount
    @status = "pending"
  end

  def valid?
    if self.receiver.valid? && self.sender.valid?
      return true
    else
      return false
    end
  end

  # def execute_transaction
  #   if self.status == "pending"
  #     self.sender.balance -= amount
  #     self.receiver.balance += amount
  #     self.status = "complete"
  #   elsif !self.sender.valid?
  #     self.status = "pending"
  #     return "Transaction rejected. Please check your account balance."
  #   end
  # end

  def execute_transaction
    if self.sender.valid? && self.sender.balance >= amount
      if self.status == "pending"
        self.sender.balance -= amount
        self.receiver.balance += amount
        self.status = "complete"
      end
    else
      self.status = "rejected"
      return "Transaction rejected. Please check your account balance."
    end
  end

  def reverse_transfer
    if self.status == "complete"
      self.sender.balance += amount
      self.receiver.balance -= amount
      self.status = "reversed"
    end
  end

end

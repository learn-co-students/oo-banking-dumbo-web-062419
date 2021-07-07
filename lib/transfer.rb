class Transfer
  
  attr_accessor :sender, :receiver, :status, :amount

  def initialize(sender, receiver, status='pending', amount)
    @sender = sender
    @receiver = receiver
    @status = status
    @amount = amount
  end

  def valid?
    if sender.valid? && receiver.valid?
      return true
    else 
      return false
    end
  end

  def execute_transaction
    if sender.valid? == true && @status == 'pending'
      receiver.balance += amount
      sender.balance -= amount
      @status = 'complete'
    end
    
    if
      sender.valid? == false
      @status = 'rejected'
      'Transaction rejected. Please check your account balance.'
    end
  end

  def reverse_transfer
    if @status == 'complete'
      receiver.balance -= amount
      sender.balance += amount
      @status = 'reversed'
    end
  end
    


end

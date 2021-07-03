# frozen_string_literal: true

require 'pry'

class Transfer
  attr_accessor :sender, :receiver, :status, :amount

  def initialize(sender, receiver, amount = 50)
    @sender = sender
    @receiver = receiver
    @status = 'pending'
    @amount = amount
  end

  def valid?
    @sender.valid? && @receiver.valid?
  end

  def ready_to_execute?
    status != 'complete' && valid? && sender.balance >= amount
  end

  def execute_transaction
    if ready_to_execute?
      @sender.balance -= amount
      @receiver.balance += amount
      @status = 'complete'
    else
      @status = 'rejected'
      'Transaction rejected. Please check your account balance.'
    end
  end

  def reverse_transfer
    if status == 'complete'
      @sender.balance += amount
      @receiver.balance -= amount
      self.status = 'reversed'
    end
  end
end

# binding.pry

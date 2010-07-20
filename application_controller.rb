# application_controller.rb
# NSOperationDebug
#
# Created by Leigh Caplan on 7/19/10.
# Copyright 2010 Onehub, Inc. All rights reserved.


class ApplicationController
  attr_accessor :button, :queue, :processing
  
  def awakeFromNib
    self.queue = NSOperationQueue.new
  end
  
  def process(sender)
    unless queue.operations.size > 0
      queue.addOperation(BustedOperation.new)
    end
  end
  
  def processing!
    self.processing = true
  end
  
  def idle!
    self.processing = false
  end
end
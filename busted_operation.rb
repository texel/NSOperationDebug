# busted_operation.rb
# NSOperationDebug
#
# Created by Leigh Caplan on 7/19/10.
# Copyright 2010 Onehub, Inc. All rights reserved.


class BustedOperation < NSOperation
  attr_accessor :done
  
  def main      
    app_controller = NSApplication.sharedApplication.delegate

    app_controller.performSelectorOnMainThread(:processing!, withObject: nil, waitUntilDone: false)
    
    perform_task
    
    run_loop = NSRunLoop.currentRunLoop
    run_loop.run
    
    while (!done) do
      run_loop.runMode(NSDefaultRunLoopMode beforeDate: NSDate.distantFuture)
    end
    
    puts 'done'
        
    app_controller.performSelectorOnMainThread(:idle!, withObject: nil, waitUntilDone: false)
  end
  
  def done?
    !!done
  end
  
  def exit!
    puts "exiting operation..."
    self.done = true
  end
  
  def perform_task
    TaskPerformer.perform_task
    puts "performed task"
    exit!
  end
end
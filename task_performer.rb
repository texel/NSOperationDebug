# task_performer.rb
# NSOperationDebug
#
# Created by Leigh Caplan on 7/19/10.
# Copyright 2010 Onehub, Inc. All rights reserved.

class TaskPerformer
  def self.perform_task
    puts "performing task"
    t = NSTask.new
    t.launchPath = '/bin/sleep'
    t.arguments  = ['2']
    t.waitUntilExit
    t.launch
  end
end

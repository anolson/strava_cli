module StravaCli
  module Output
    def overwrite_output(string)
      print "#{string.ljust(80)}\r"
      STDOUT.flush
    end
  end
end

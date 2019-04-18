# class to call ascii art char
class Ascii
  def write_x(i)
     return " __  __  " if i==0
     return " \\ \\/ /  " if i==1
     return "  \\  /   " if i==2
     return "  /  \\   " if i==3
     return " /_/\\_\\  " if i==4
  end

  def write_o(i)
     return "   ___   " if i==0
     return "  / _ \\  " if i==1
     return " | | | | " if i==2
     return " | |_| | " if i==3
     return "  \\___/  " if i==4
  end

  def write_abc(j,i)
    if j==1
      return "    _    " if i==0
      return "   / \\   " if i==1
      return "  / _ \\  " if i==2
      return " / ___ \\ " if i==3
      return "/_/   \\_\\" if i==4
    end
    if j==2
      return "  ____   " if i==0
      return " | __ )  " if i==1
      return " |  _ \\  " if i==2
      return " | |_) | " if i==3
      return " |____/  " if i==4
    end
    if j==3
      return "   ____  " if i==0
      return "  / ___| " if i==1
      return " | |     " if i==2
      return " | |___  " if i==3
      return "  \\____| " if i==4
    end
  end

  def write_123(j,i)
    if j==1
      return "     _   " if i==0
      return "    / |  " if i==1
      return "    | |  " if i==2
      return "    | |  " if i==3
      return "    |_|  " if i==4
    end
    if j==2
      return "  ____   " if i==0
      return " |___ \\  " if i==1
      return "   __) | " if i==2
      return "  / __/  " if i==3
      return " |_____| " if i==4
    end
    if j==3
      return "  _____  " if i==0
      return " |___ /  " if i==1
      return "   |_ \\  " if i==2
      return "  ___) | " if i==3
      return " |____/  " if i==4
    end
  end
end

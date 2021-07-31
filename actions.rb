require 'tty/prompt'

module Actions

  Roles = ["Admin", "User", "Pirate", "Shark"].freeze

  def select_roles
    system('clear')
    prompt = TTY::Prompt.new
    puts "#{message}"
    @role_select = prompt.multi_select("Select as many roles as you want don't be shy. Selected roles:", Roles)
    system('clear')
    menu
  end

  def message
    day = Time.now.wday
    @name = "Stranger" if @name == ""
    text_array = [
      "Hey #{@name}, don't you think Mondays should stop existing?",
      "Hey #{@name}, the only good thing Tuesday does is make you feel proud about surviving Monday.",
      "Its Wednesday #{@name}, you are half way there don't worry. Keeping hustling.",
      "Its just another boring Thrusday #{@name}.",
      "Woaah, please tell me you are gonna party hard today #{@name}. You totally deserve it.",
      "Its cardinal sin to even get out of your bed on Saturday #{@name}.",
      "Sunday. Funday. #{@name} day."
    ]
    return text_array[day-1]
  end

  def menu
    text_actions_prompt = TTY::Prompt.new
    system('clear')
    total = @texts.length
    if total == 0
      puts "Oops, it looks like there isn't much data to show you. Maybe you can create your own if you are an admin."
      puts "If you are not an admin: Become one!" unless @role_select.include? "Admin"
    else
      for i in 0..total-1 do
        puts "Text number #{i+1}:"
        puts "#{@texts[i]}"
        puts ""
      end
    end
    array = create_action_array
    array.append("Exit the program")
    value = text_actions_prompt.select("Actions", array)
    case value
    when "Edit an entry"
      edit
    when "Delete an entry"
      delete
    when "Create a new entry"
      create
    when "Edit my roles"
      select_roles
    when "Exit the program"
      exit_the_program
    else
      puts "Something wrong has occured. Please let sayan know his coding skills need work, so does this app."
    end
  end

  def create
    system('clear')
    puts "You can type something here. Anything. No judging"
    text = gets.chomp
    @texts.append(text)
    menu
  end

  def edit
    puts "Type the file number you want to edit"
    number  = gets.chomp
    puts "Rewrite the file"
    new_text = gets.chomp
    @texts[number.to_i - 1] = new_text
    menu
  end

  def delete
    puts "Type the file number you want to delete"
    number = gets.chomp
    @texts.delete(@texts[number.to_i - 1])
    menu
  end

  def exit_the_program
    system('clear')
    puts ""
    puts "Thank you for stopping by and visit again. You are breathtaking!!"
    puts ""
    exit
  end

  def create_action_array
    array = ["Edit my roles"]
    create_text = "Create a new entry"
    edit_text = "Edit an entry"
    delete_text = "Delete an entry"

    if @role_select.include? "Admin"
      array.append(create_text) unless array.include? create_text
      if !@texts.empty?
        array.append(edit_text) unless array.include? edit_text
        array.append(delete_text) unless array.include? delete_text
      end
    end
    if @role_select.include? "Shark" && !@texts.empty?
      array.append(delete_text) unless array.include? delete_text
    end
    if @role_select.include? "Pirate" && !@texts.empty?
      array.append(edit_text) unless array.include? edit_text
    end
    return array
  end
end
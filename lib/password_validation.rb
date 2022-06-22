class PasswordValidation
  MIN_PASSWORD_SIZE = 12
  VALID_PASSWORD = /^(?=.*\d)(?=.*[a-z])(?=.*[A-Z])(?=.*\W)\S{#{MIN_PASSWORD_SIZE},}$/

  class << self
    def check(password)
      if password.match? VALID_PASSWORD
        "Надежный пароль."
      else
        "Слабый пароль. #{print_recommendations(password)}"
      end
    end

    private
    def print_recommendations(password)
      mistakes = []
      print_r = ''

      mistakes << "добавьте #{MIN_PASSWORD_SIZE - password.size} символов" if password.size < MIN_PASSWORD_SIZE
      mistakes << "добавьте одну цифру" unless password.match /\d/
      mistakes << "добавьте один спецсимвол" unless password.match /\W/
      mistakes << "добавьте заглавную букву" unless password.match /[A-Z]/

      mistakes.each do |m|
        if m == mistakes.last
          print_r << "#{m}."
        else
          print_r << "#{m}, "
        end
      end

      print_r.capitalize!
    end
  end
end

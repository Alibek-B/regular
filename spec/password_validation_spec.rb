require 'password_validation'

describe PasswordValidation do
  context 'valid password' do
    it '.check' do
      expect(PasswordValidation.check('qwerty1!Qwerty')).to eq('Надежный пароль.')
    end
  end

  context 'invalid password' do
    it '.check' do
      expect(PasswordValidation.check('qwerty')).to eq('Слабый пароль. Добавьте 6 символов, добавьте одну цифру, добавьте один спецсимвол, добавьте заглавную букву.')
    end

    it '.check' do
      expect(PasswordValidation.check('qwerty1')).to eq('Слабый пароль. Добавьте 5 символов, добавьте один спецсимвол, добавьте заглавную букву.')
    end

    it '.check' do
      expect(PasswordValidation.check('qwerty!')).to eq('Слабый пароль. Добавьте 5 символов, добавьте одну цифру, добавьте заглавную букву.')
    end

    it '.check' do
      expect(PasswordValidation.check('qwertyQ')).to eq('Слабый пароль. Добавьте 5 символов, добавьте одну цифру, добавьте один спецсимвол.')
    end

    it '.check' do
      expect(PasswordValidation.check('qwerty1Q')).to eq('Слабый пароль. Добавьте 4 символов, добавьте один спецсимвол.')
    end
  end
end

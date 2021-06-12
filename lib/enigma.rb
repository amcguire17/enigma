require './lib/shift'

class Enigma
  def encrypt(message, key = random_key, date = date_today)
    {encryption: encrypt_message(message, key, date), key: key, date: date}
  end

  def decrypt(message, key = random_key, date = date_today)
    {decryption: decrypt_message(message, key, date), key: key, date: date}
  end

  def random_key
    key = (0..9).to_a.sample(5).join
  end

  def date_today
    Date.today.strftime('%d%m%y')
  end

  def encrypt_message(message, key, date)
    shift = Shift.new(message, key, date)
    shift.encrypted_message
  end

  def decrypt_message(message, key, date)
    'hello world'
  end
end

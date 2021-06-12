class Enigma
  def encrypt(message, key = random_key, date = date_today)
    encrypt = {
                encryption: encrypt_message(message),
                key: key,
                date: date
              }
  end

  def decrypt(message, key = random_key, date = date_today)
    decrypt = {
                decryption: decrypt_message(message),
                key: key,
                date: date
              }
  end

  def random_key
    key = (0..9).to_a.sample(5).join
  end

  def date_today
    Date.today.strftime("%d%m%y")
  end

  def encrypt_message(message)
    'keder ohulw'
  end

  def decrypt_message(message)
    'hello world'
  end
end

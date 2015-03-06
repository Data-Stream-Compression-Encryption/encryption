from pyDes import *


encryptor3 = triple_des("abcdef0987654321")

data = "pooppoop"

hash = encryptor3.encrypt(data)

print(''.join('{:02x}'.format(x) for x in hash))

idk = encryptor3.decrypt(hash)

print(idk)
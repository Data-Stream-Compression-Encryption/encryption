from pyDes import *
from binascii import *
import os


# testFile = open('testData1outsim','rb')
# print("test read")
# print(''.join('{:02x}'.format(x) for x in testFile.read(8)))
# testFile.close()

inFileName = 'testData1.bmp'
outFileName = 'testData1outsim'

inFile = open(inFileName,'rb')
outFile = open(outFileName,'w')




def characterize(obj):
    rv = str()
    for i in range(0,24):
        mask = 0xFF << ((23-i)*8)
        rv = rv + chr((mask&obj)>>((23-i)*8))
        # print("rv"+str(i))
        # print(str((mask&obj)>>((23-i)*8)))
    return rv

key = characterize(418473449025778717611738119341906991972278453064634151731)
encryptor3 = triple_des(key)
inFileSize = os.stat(inFileName).st_size

while(inFileSize > 0):
    data = inFile.read(8)

    if data is None:
        break




    hash = encryptor3.encrypt(data)

    outFile.write(''.join('{:02x}'.format(x) for x in hash))

    inFileSize = inFileSize - 8

    if((inFileSize%1024)==0):
        print(inFileSize)
    # print("input:")
    # print(''.join('{:02x}'.format(x) for x in bytes8))
    # print("output:")
    # print(''.join('{:02x}'.format(x) for x in hash))

inFile.close()
outFile.close()

print('Done')

import os


simFileName = 'testData1outsim'
devFileName = 'testData1Out'

simFile = open(simFileName,'rb')
devFile = open(devFileName,'rb')

simFileSize = os.stat(simFileName).st_size
devFileSize = os.stat(devFileName).st_size

size = int(0)

if(simFileSize > devFileSize):
    size = simFileSize
else:
    size = devFileSize

i = size

while(i > 0):
    if(simFile.read(1) != devFile.read(1)):
        break
    i=i-1

print(size-i)
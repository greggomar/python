import statistics
from os import listdir
from os.path import isfile, join
import csv

mypath = "/Users/go/Downloads/fullFreqData"
onlyfiles = [f for f in listdir(mypath) if isfile(join(mypath, f))]
'''
print(f)
print(i)
file_n = onlyfiles[i]
'''
for i in onlyfiles:
	y,c = 0,0
	#print(i)
	file_n = "/Users/go/Downloads/fullFreqData/"+i
	with open(file_n) as csvfile:
		freqReader = csv.reader(csvfile, delimiter=',', quotechar='|')
		for row in freqReader:
			x = statistics.mean(row)
			y += x
			#print x
			print('mean for row ',c,': ', x)
			c += 1
			#print('sum of means: ', y)
		meanmean = y/512
		print("mean of means: ", meanmean)
# By: Gregory O'Marah
# USF -- CIS4930 Hardware Security
# Import and analyse data from RO PUF, & export to csv / excel 

from statistics import *
from os import listdir
from os.path import isfile, join
import csv
srcPath = "/Users/go/Downloads/fullFreqData/"
dstPath0 = "/Users/go/Downloads/pufMean.txt"
dstPath1 = "/Users/go/Downloads/pufCLN.txt"
dstPath2 = "/Users/go/Downloads/pufDC.txt"
dstPath3 = "/Users/go/Downloads/HD_CLN.txt"
dstPath4 = "/Users/go/Downloads/HD_DC.txt"
fileList = [f for f in listdir(srcPath) if isfile(join(srcPath, f))]
rows_count, cols_count = 512, len(fileList)
c = 0
matrix = [[0 for g in range(rows_count)] for h in range(cols_count)] 
for i in fileList:
    y, r = 0, 0
    file_n = srcPath + i
    with open(file_n) as srcfile:
        freqReader = csv.reader(srcfile, delimiter=',', quotechar='|')
        for row in freqReader:
	        x = mean(row)
	        y += x
	        matrix[c][r] = x 
	        r += 1
    c += 1
with open(dstPath0, 'w') as csvfile:
    csvWriter = csv.writer(csvfile, delimiter=',', quotechar='|', quoting=csv.QUOTE_MINIMAL)
    for n in range (cols_count):
    	csvWriter.writerow(matrix[n])
CLN = [[0 for g in range(rows_count-1)] for h in range(cols_count)] 
DC = [[0 for g in range(rows_count/2)] for h in range(cols_count)]
for c in range(193):
	for r in range(511):
		CLN[c][r] = 1 if(matrix[c][r]>matrix[c][r+1]) else 0
	for s in range(256):
		DC[c][s] = 1 if(matrix[c][s]>matrix[c][s+2]) else 0
with open(dstPath1, 'w') as csvfile:
    csvWriter = csv.writer(csvfile, delimiter=',', quotechar='|', quoting=csv.QUOTE_MINIMAL)
    for n in range (cols_count):
    	csvWriter.writerow(CLN[n])
with open(dstPath2, 'w') as csvfile:
    csvWriter = csv.writer(csvfile, delimiter=',', quotechar='|', quoting=csv.QUOTE_MINIMAL)
    for n in range (cols_count):
    	csvWriter.writerow(DC[n])
HD_CLN = [[0 for g in range(511)] for h in range(18528)] 
HD_DC = [[0 for g in range(256)] for h in range(18528)] 
c = 0
for col in range(193):
	kol_n = col + 1
	for kol in range(kol_n, 193):
		for t in range(511  ):
			HD_CLN[c][t] = CLN[col][t]^CLN[kol][t]
		for t in range(256):
			HD_DC[c][t] = DC[col][t]^DC[kol][t]
		c+=1
with open(dstPath3, 'w') as csvfile:
    csvWriter = csv.writer(csvfile, delimiter=',', quotechar='|', quoting=csv.QUOTE_MINIMAL)
    for n in range (18528):
    	csvWriter.writerow(HD_CLN[n])
with open(dstPath4, 'w') as csvfile:
    csvWriter = csv.writer(csvfile, delimiter=',', quotechar='|', quoting=csv.QUOTE_MINIMAL)
    for n in range (18528):
    	csvWriter.writerow(HD_DC[n])
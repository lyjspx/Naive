#!/usr/bin/env python
# -*- coding: utf-8 -*-
import re, math, sys

if __name__ == '__main__':
    training_percent = 0.8 # how many genes being for training
    CGI_indice, count_CGI, count_non_CGI, confusion = {}, {}, {}, {} # dictionary to store CGI start-end, 16 2-letter counts for CGI and non-CGI, confusion matrix
    with open('data_hum_start.txt', 'r') as CGI_index_file: 
        for name, i, j in re.findall(r'([^\s]+)[\s]+' + r'([0-9]+)[\s]+'*2 + r'(?:[^\s]+[\s]*){6}', CGI_index_file.read()):
            CGI_indice.setdefault(name, []).extend((int(i)-1, int(j)))
    with open('CGI_examples.txt', 'w+') as CGI_file, open('non_CGI_examples.txt', 'w+') as non_CGI_file, open('data_all.seq', 'r') as Gene_seq_file:
        Gene_seq = Gene_seq_file.read()
        gene_names = sorted(CGI_indice.keys()) # all the concerned gene names
        num_train = round(len(gene_names)*training_percent) # number of genes for training
        for i, (name, seq) in enumerate(re.findall('>(?:(' + '|'.join(gene_names) + '))([^>]+)', Gene_seq)): # for each gene
            seq = seq.replace('\n', '') # sequence under a gene name
            partition = sorted(CGI_indice[name] + [0, len(seq)]) # even segments are non-CGI, odd ones are CGI
            isTraining = i < num_train # whether this gene is for training
            sys.stdout.write((('', '\n')[i == num_train] + "\rtesting : [%-20s] %3d%%" % ('*'*int(20*(i - num_train + 1)/(len(gene_names) - num_train)), int(100*(i - num_train + 1)/(len(gene_names) - num_train))), "\rtraining: [%-20s] %3d%%" % ('*'*int(20*(i + 1)/num_train), int(100*(i + 1)/num_train)))[isTraining]) # display process percentage
            sys.stdout.flush()
            for j in range(len(partition)-1): # for each example
                example = seq[partition[j]:partition[j+1]] # sequence segments which is either CGI or non CGI based on the order of the segment
                isNonCGI = j%2 == 0 # whether this example is CGI
                likelihood_ratio = 0 # log likelihood ratio
                if not re.search('[^acgtACGT]', example): # exclude the abnormal letters such as m, n, x, y ...
                    (CGI_file, non_CGI_file)[isNonCGI].write('>' + name + '\n' + example + '\n') # Save the extracted examples to seperative files
                    count = (count_CGI, count_non_CGI)[isNonCGI] # 2-letter counts, # of AA,AC,AG,AT,CA...
                    pre_letter = example[0].upper()
                    for letter in example[1:]: # scan the example letter by letter
                        letter = letter.upper() # unify the case
                        if isTraining: # first 80% genes for Training
                            count[pre_letter + letter] = count.get(pre_letter + letter, 0) + 1
                        else: # the other for Testing; multiply 1.0 to make python 2 perform true point division
                            likelihood_ratio += math.log(count_CGI[pre_letter + letter]*sum(count_non_CGI[pre_letter + each] for each in 'ACGT')/(count_non_CGI[pre_letter + letter]*1.0)/(sum(count_CGI[pre_letter + each] for each in 'ACGT')*1.0))
                        pre_letter = letter
                    if not isTraining: # count confusion matrix
                        key = ('T', 'F')[isNonCGI] + 'P' if likelihood_ratio > 0 else ('F', 'T')[isNonCGI] + 'N'
                        confusion[key] = confusion.get(key, 0) + 1
    sys.stdout.write('\n\nCG island transitions probabilities :\n') # display the result
    for s in 'ACGT':
        for t in 'ACGT':
             sys.stdout.write(s + '->' + t + ': ' + str(count_CGI[s + t]/(sum(count_CGI[s + each] for each in 'ACGT')*1.0)) + '\n')
    sys.stdout.write('\nNon CG island transitions probabilities :\n')
    for s in 'ACGT':
        for t in 'ACGT':
             sys.stdout.write(s + '->' + t + ': ' + str(count_non_CGI[s + t]/(sum(count_non_CGI[s + each] for each in 'ACGT')*1.0)) + '\n')
    sys.stdout.write('\nConfusion Matrix :\n')
    for k in confusion.keys():
        sys.stdout.write(k + ': ' + str(confusion[k]) + '\n')
    sys.stdout.write('\nAccuracy = ' + str((confusion['TP'] + confusion['TN'])/(sum(confusion.values())*1.0)) + '\n')
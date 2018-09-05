import logging
logger = logging.getLogger('prediction')

def analysis(data):
	#calculate all rRNA features
	results ={}
	results['Nucleotide Fraction']=nucleotide_freq(data)
	results['GC']=GC(data)
	results2 = {}
	for key in results.keys():
		if isinstance(results[key],dict):
			for subkey in results[key].keys():
				results2[key+': '+subkey]=results[key][subkey]
		else: 
			results2[key] = results[key]
	return results2

def number(data):
	#calculate the number of rRNAs
	count = 0.0
	for x in data:
		count = count+1
	return count

def nucleotide_freq(data):
	#calculate nucleotide fractions of the rRNA sequences
	#ignore Ns
	#as this is read from the genome, count T's rather than U's
	A=0.0
	G=0.0
	T=0.0
	C=0.0
	for x in data:
		input = data[x]
		A = A+float(input.seq.count('A'))
		G = G+float(input.seq.count('G'))
		T = T+float(input.seq.count('T'))
		C = C+float(input.seq.count('C'))
	total = A+G+T+C
	return {'A':A/total,'C':C/total,'G':G/total,'T':T/total}
	

def GC(data):
	#calculate the GC fraction of the rRNA sequences
	#ignore Ns
	#as this is read from the genome, count T's rather than U's
	A=0.0
	G=0.0
	T=0.0
	C=0.0
	for x in data:
		input = data[x]
		A = A+float(input.seq.count('A'))
		G = G+float(input.seq.count('G'))
		T = T+float(input.seq.count('T'))
		C = C+float(input.seq.count('C'))
	total = A+G+T+C
	return (G+C)/total

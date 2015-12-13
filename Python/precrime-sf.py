import csv

def CatDescript(crimes):
	"""
	build dictionary
	=>put descriptions into dictionary as keys. 
	for each key check if exists
		if key doesn't exist:
			add key to dictionary
		check if the category exists for the key
		if the category doesn't exist: 
			add category to row with key
	
	go through dictionary and print out key and categories where there are is then one category.
	"""
	dic = {}
	for row in crimes:
		col = 0
		if not dic.has_key(row['Descript']):
			dic[row['Descript']] = [row['Category']] #new dictionary key with new value
		else:
			if row['Category'] not in dic[row['Descript']]:
				dic[row['Descript']].append(row['Category'])
	
	for key in dic:
		if len(dic[key]) > 1:
			print(key, dic[key])

with open('C:\\Users\\David Dupuis\\Desktop\\School\\ESILV\\Semestre 9\\PI2-A5\\data\\train.csv', 'rb') as csvfile:
	crimes = csv.DictReader(csvfile)#, delimiter= ',', quotechar='"'
	CatDescript(crimes)


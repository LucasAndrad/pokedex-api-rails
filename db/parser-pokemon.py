import csv

def set_image_number(number):
	image_number = ''
	if number < 10:
		image_number = '000' + str(number)
	elif number < 100:
		image_number = '00' + str(number)
	else:
		image_number = '0' + str(number)
		
	image_name = image_number+'.png'
	return image_name
	
def create_pokemons(file_name):
	initial_text = 'Pokemon.create([\n'
	data = open(file_name, 'r')
	reader = csv.reader(data)
	next(reader)
	with open("./seeds/pokemons.rb", 'w') as outfile:
		outfile.write(initial_text)
		for number,name,type_1,type_2,total,hp,attack,defense,sp_atk,sp_def,speed,generation,legendary in reader:
			pokemon = ''
			image_name = set_image_number(int(number))
			pokemon = '  {number:'+ number +', name:"'+ name +'", type_1:"'+ type_1 +'", type_2:"'+ type_2 +'", total:'+ total +', hp:'+ hp +', attack:'+ attack +', defense:'+ defense +', sp_atk:'+ sp_atk +', sp_def:' + sp_def +', speed:'+ speed +', generation:'+ generation +', legendary:'+ legendary + ', image:"'+ image_name +'"},\n'
			outfile.write(pokemon)
		outfile.write('])')
create_pokemons('pokemon.csv')

use strict;

while(<>){
	next if /^Flag/;
	next if /^French/;
	s/,//g;
	s/\t*English.*//;
	s/\t*French.*//;
	s/'//g;
	print;
}


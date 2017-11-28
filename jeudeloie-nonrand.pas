program jeu_de_l_oie;

uses crt;

//BUT : écrire un algorithme qui simule le jeu de l'oie avec un système de jet de manuel.
//ENTREES : Jets de dé de l'utilisateur
//SORTIES : Victoire du joueur
const

rolls:integer=1; //rolls<-1:ENTIER

var

memoirede,de,sommede,place,roll : integer; //memoirede,de,sommede,place,roll:ENTIER
key : byte; //key:BYTE

BEGIN
	roll:=0; //Initialisation
	place:=0;
	de:=0;
	sommede:=0;
	memoirede:=0;
	clrscr;
	REPEAT
		writeln('Please enter the value of your first roll (1-6)');
		readln(de);
			WHILE ((de>6)OR(de<1))DO
			begin
			writeln('Incorrect value. Please enter the value of your first roll again (1-6)');
			readln(de)
			end;
		sommede:=sommede+de;
		writeln('Please enter the value of your second roll (1-6)');
		readln(de);
			WHILE ((de>6)OR(de<1))DO
			begin
			writeln('Incorrect value. Please enter the value of your second roll again (1-6)');
			readln(de)
			end;
		sommede:=sommede+de;
			place:=place+sommede; //Mouvement du joueur
			writeln('Your position : ',place);
			memoirede:=sommede;
			sommede:=0;
			IF place=58 THEN //Retour à la case départ
				begin
					writeln('Ouch ! You fell into the well ! Back to the begining.');
					place:=0;
				end
						ELSE WHILE (place MOD 9=0)AND(place<62)DO //Jet doublé
						begin
							writeln('You encounter a goose. Your roll is doubled !');
							place:=place+memoirede;
							writeln('Your position : ',place);
						end;
							IF place>66 THEN //Plus loin que 66
							begin
								place:=(place-((place-66)*2));
								writeln('You went over 66 ! What`s left of your roll was walked backwards');
								writeln('Your position : ',place)
							end;
	until place=66;
	writeln('Congrats ! You won.'); //Victoire
	readkey;
END.

//DEBUT
//roll<-0
//key<-0
//place<-0
//de<-0
//sommede<-0
//memoirede<-0
//REPETER
//	ECRIRE "Veuillez saisir la valeur de votre premier jet. (1-6)"
//	ECRIRE de
//		TANTQUE ((de>6)OU(de<1)) FAIRE
//			ECRIRE "Valeur incorrecte. Veuillez saisir une valeur valide. (1-6)"
//			LIRE de
//		FINTANTQUE
//	sommede<-sommede+de
//	ECRIRE "Veuillez saisir la valeur de votre second jet. (1-6)"
//	ECRIRE de
//		TANTQUE ((de>6)OU(de<1)) FAIRE
//			ECRIRE "Valeur incorrecte. Veuillez saisir une valeur valide. (1-6)"
//			LIRE de
//		FINTANTQUE
//	sommede<-sommede+de
//place<-place+sommede
//ECRIRE "Votre position:",place
//memoirede<-sommede
//sommede<-0
//	SI place=58 ALORS
//		ECRIRE "Mince ! Vous êtes tombé dans le puits... Retour à la case départ !"
//		place:=0
//	SINON
//		TANTQUE (place MOD 9=0) ET (place<62) FAIRE
//			ECRIRE "Vous êtes tombé sur une oie ! Votre jet est doublé."
//			place<-place+memoirede
//			ECRIRE "Votre position :",place
//		FINTANTQUE
//	FINSI
//	SI place>66 ALORS
//		place<-(place-((place-66)*2))
//		ECRIRE "Vous êtes allé au-delà de l'arrivée ! Vous parcourez le nombre de pas restants de votre jet à l'envers."
//		ECRIRE "Votre position :",place
//	FINSI
//JUSQU'A place=66
//ECRIRE "Félicitations ! Vous avez gagné"
//FIN
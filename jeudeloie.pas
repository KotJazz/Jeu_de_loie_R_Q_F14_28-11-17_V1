program jeu_de_l_oie;

uses crt;

//BUT : écrire un algorithme qui simule le jeu de l'oie avec un système de jet de dés simulé.
//ENTREES : Jets de dé de l'utilisateur
//SORTIES : Victoire du joueur
const

rolls:integer=1; //rolls<-1:ENTIER

var

memoirede,de,sommede,place,roll : integer; //memoirede,de,sommede,place,roll:ENTIER
key : byte; //key:BYTE

BEGIN
	roll:=0; //Initialisation
	key:=0;
	place:=0;
	de:=0;
	sommede:=0;
	memoirede:=0;
	clrscr;
	REPEAT
		FOR roll:=0 to rolls do
			begin
				writeln('Press enter to roll a dice'); //J'ai choisi l'anglais parce que les accents ne sont pas affichés par la console, ce qui rend le français illisible.
				key:=ord(readkey);
				IF key=13 THEN //La valeur ordinale de la touche enter est 13.
				begin
					randomize; //On réinitialise le générateur de nombres aléatoires
					de:=(random(6)+1);
					writeln(de);
					sommede:=sommede+de;
					memoirede:=sommede
				end;
			end;
				place:=place+sommede; //Mouvement du joueur
				writeln('Your position : ',place);
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
//	POUR roll DE 0 A rolls FAIRE
//		ECRIRE "Lancez un dé un appuyant sur entrée."
//		LIRE key (valeur ordinale de la touche)
//			SI key=13 ALORS
//				de<-ALEA(1,6)
//				ECRIRE de
//				sommede<-sommede+de
//				memoirede<-sommede
//			FIN
//	FINPOUR
//place<-place+sommede
//ECRIRE "Votre position:",place
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
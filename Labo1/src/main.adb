with Ada.Text_IO;
with Ada.Calendar;
with dekl;
use Ada.Text_IO;
use Ada.Calendar;
use dekl;

procedure main is
   Length: Natural := 5;
   Vect: Wektor(0..Length-1);
   T1, T2: Time;
   D: Duration;
begin
   put_line("Pierwsza czesc:");
   RandomWektor(Vect,Length);
   T1 := Clock;
   SortWektor(Vect,Length);
   T2 := Clock;
   D := T2 - T1;
   ShowWektor(Vect,Length);
   put_line("Czas obliczen = " & D'Img & "[s]");

   put_line("Druga czesc:");
   PrintFile("plik.txt");

end main;

with Ada.Text_IO;
with Ada.Numerics.Float_Random;
with Ada.Calendar;
use Ada.Text_IO;
use Ada.Numerics.Float_Random;
use Ada.Calendar;

package body dekl is
   
   procedure ShowWektor (Vect: in Wektor;Length: in Natural) is
   begin
      for I in 0..(Length-1) loop
         Put_Line(Float'Image (Vect (I)));
      end loop;
   end ShowWektor;
   
   procedure RandomWektor (Vect: in out Wektor;Length: in Natural) is
      Gen: Generator;
   begin
      Reset(Gen);
      for I in 0..(Length-1) loop
         Vect(I) := Random(Gen);
      end loop;
   end RandomWektor;
   
   procedure SortWektor (Vect: in out Wektor;Length: in Natural) is
      SwapVar: Float := 0.0;
   begin
      for I in 1..(Length-1) loop
         for J in 1..(Length-I) loop
            if Vect(J-1)>Vect(J) then 
               SwapVar := Vect(J-1);
               Vect(J-1) := Vect(J);
               Vect(J) := SwapVar;
            end if;
         end loop;
      end loop;
   end SortWektor;
   
   procedure PrintFile(FileName: in String) is
      File: File_Type;
      Logs : File_Type;
      
      T1: Time;
      T2: Time;
      D: Duration;
      
      HoursStart: Integer;
      MinutesStart: Integer;
      SecondsStart: Integer;
      HoursEnd: Integer;
      MinutesEnd: Integer;
      SecondsEnd: Integer;
   begin 
      begin
          Open(Logs,Append_File,"dziennik.txt");
            exception
               when Name_Error =>
                  Create(Logs, Out_File, "dziennik.txt");
            end;
      T1 := Clock;
      begin
         Open (File, In_File, FileName);
      exception
         when Name_Error => 
            HoursStart:=Integer(Seconds(T1)/3600);
            MinutesStart:=(Integer(Seconds(T1))-HoursStart*3600)/60;
            SecondsStart:=Integer(Seconds(T1))-HoursStart*3600-MinutesStart*60;
            
            Put_Line("Bledna nazwa pliku <" & FileName & "> !");
            Put_Line (Logs, FileName&": "&Year(T1)'Img & Month(T1)'Img &Day(T1)'Img &"/"& HoursStart'Img &MinutesStart'Img &SecondsStart'Img & ": Bledna nazwa pliku!");
      end;
      while not End_Of_File(File) loop
         Put_Line(Get_Line(File));
      end loop;
      Close(File);
      T2 := Clock;
      D := T2 - T1;
      Put_Line("Czas wyswietlania = " & D'Img & "[s]");
      HoursStart:=Integer(Seconds(T1)/3600);
      MinutesStart:=(Integer(Seconds(T1))-HoursStart*3600)/60;
      SecondsStart:=Integer(Seconds(T1))-HoursStart*3600-MinutesStart*60;
      HoursEnd:=Integer(Seconds(T1)/3600);
      MinutesEnd:=(Integer(Seconds(T1))-HoursEnd*3600)/60;
      SecondsEnd:=Integer(Seconds(T1))-HoursEnd*3600-MinutesEnd*60;
      put_line(Logs, FileName&":"& Year(T1)'Img&Month(T1)'Img&Day(T1)'Img&"/"&HoursStart'Img &MinutesStart'Img &SecondsStart'Img & "-"&Year(T2)'Img &Month(T2)'Img&Day(T2)'Img &"/"& HoursEnd'Img &MinutesEnd'Img &SecondsEnd'Img &"("&D'Img&")");
      end PrintFile;
end dekl;

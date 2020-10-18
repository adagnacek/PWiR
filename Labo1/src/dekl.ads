package dekl is

   type Wektor is array (Natural range <>) of Float;
 
   procedure ShowWektor (Vect: in dekl.Wektor;Length: in Natural);
   procedure RandomWektor (Vect: in out dekl.Wektor;Length: in Natural);
   procedure SortWektor (Vect: in out dekl.Wektor;Length: in Natural);
   procedure PrintFile (FileName: in String);

end dekl;

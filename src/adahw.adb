-------------------------------------------------------------------------
--
--  Program: Ada Homework
--  Purpose: Take in test result data and output conditional probability
--  Author: Greg Fletcher, Jason Fazio, Nick Currie
--
-------------------------------------------------------------------------
with Ada.Text_IO; use Ada.Text_IO;
with Ada.Integer_Text_IO; use Ada.Integer_Text_IO;
use Ada.Integer_Text_IO;
with Ada.Float_Text_IO; use Ada.Float_Text_IO;
procedure Adahw is
   pos1total, neg1total, pos1sick, neg1health, pos2total, neg2total, pos2sick, neg2health: Integer := 0;
   type patientRecords is array (Positive range <>, Positive range <>) of Integer;
   i, numberofpatients: Integer;
   test1pp, test1np, test2pp, test2np: Float;
   --results : String(1..150);
   cr : Character := ASCII.CR;
   function GetInput (records: in out patientRecords) return patientRecords is
      --For loop to get patient data input and insert into an array.
   begin
      i := 1;
      while i <= numberofpatients loop
         Ada.Integer_Text_IO.Get(records(i, 1));
         Ada.Integer_Text_IO.Get(records(i, 2));
         Ada.Integer_Text_IO.Get(records(i, 3));
         Ada.Integer_Text_IO.Get(records(i, 4));
         i := i + 1;
      end loop;
      return records;
   end GetInput;

   procedure CalcTotals (records: in patientRecords) is
      --Calculate total positive and negative tests for sick and health
   begin
      while i > 1 loop
         i := i - 1;
      if records(i, 3) = 1 then
         --Increase Positive test totals
         pos1total := pos1total + 1;
         if records(i, 2) = 1 then
            --Increase Positive Test 1
            pos1sick := pos1sick + 1;
         end if;
      else
         --Increase Negative test totals
         if records(i, 2) = 0 then
            --Increase Neagtive Test 1
           neg1health := neg1health + 1;
         end if;
      end if;
      if records(i, 4) = 1 then
         --Increase Positive test totals
         pos2total := pos2total + 1;
         if records(i, 2) = 1 then
            --Increase Positive Test 1
            pos2sick := pos2sick + 1;
         end if;
      else
         --Increase Negative test totals
         if records(i, 2) = 0 then
            --Increase Neagtive Test 1
           neg2health := neg2health + 1;
         end if;
         end if;
      end loop;
      neg1total := numberofpatients - pos1total;
      neg2total := numberofpatients - pos2total;
   end CalcTotals;

   procedure CalcProb is
      --Function to calculate and output probabilities.
   begin
      if pos1total = 0 then
         test1pp := Float(pos1sick);
      else
         test1pp := Float(pos1sick)/Float(pos1total);
      end if;
      if neg1total = 0 then
        test1np := Float(neg1health);
      else
         test1np := Float(neg1health)/Float(neg1total);
         end if;
      if pos2total = 0 then
        test2pp := Float(pos2sick);
      else
         test2pp := Float(pos2sick)/Float(pos2total);
         end if;
      if neg2total = 0 then
        test2np := Float(neg2health);
      else
         test2np := Float(neg2health)/Float(neg2total);
         end if;
   end CalcProb;

   function Output return String is
      --Outputs
   begin
   if test1pp > test2pp and test1np > test2np then
         return "P(D | Pos1) = " & Float'Image(test1pp) & " P(D | Pos2) = " &
           Float'Image(test2pp) & " P(H | Neg1) = " & Float'Image(test1np) &
           " P(H | Neg2) = " & Float'Image(test2np) & " Test 1 is better.";
   elsif test1pp < test2pp and test1np < test2np then
         return "P(D | Pos1) = " & Float'Image(test1pp) & " P(D | Pos2) = " &
           Float'Image(test2pp) & " P(H | Neg1) = " & Float'Image(test1np) &
           " P(H | Neg2) = " & Float'Image(test2np) & " Test 2 is better.";
   else
         return "P(D | Pos1) = " & Float'Image(test1pp) & " P(D | Pos2) = " &
           Float'Image(test2pp) & " P(H | Neg1) = " & Float'Image(test1np) &
           " P(H | Neg2) = " & Float'Image(test2np) & " Neither test is better.";
   end if;
   end Output;


begin
   Put("Start input");
   New_Line(1);
   Get(numberofpatients);
   declare
      records : patientrecords (1..numberofpatients, 1..4);
      begin
      CalcTotals(GetInput(records));
      CalcProb;
      declare
         result: String := Output;
      begin
         Put(result);
         null;
      end;
   end;
end Adahw;

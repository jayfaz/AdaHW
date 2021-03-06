-------------------------------------------------------------------------
--
--  Program: Ada Homework
--  Purpose: Take in test result data and output conditional probability
--  Author: Greg Fletcher, Jason Fazio, Nick Currie
--
-------------------------------------------------------------------------
with Ada.Text_IO, Ada.Integer_Text_IO, Ada.Float_Text_IO;
use  Ada.Text_IO, Ada.Integer_Text_IO, Ada.Float_Text_IO;
procedure Adahw is
   type Patient is record
      id, sick, test1, test2: Integer;
      end record;
   type Patient_Records is array (Integer range<>) of Patient;
   records: Patient_Records;
   i, n, pos1total, neg1total, pos1sick, neg1health,
   pos2total, neg2total, pos2sick, neg2health: Integer := 0;
   test1pp, test1np, test2pp, test2np: Float;


   procedure SizeRecords is
      begin
      Get(n);
         declare
            records : Patient_Records (1..n);
         begin
         null;
         end;
   end SizeRecords;


   procedure GetInput is
      --Temp holder to process whitespace
      sp : Character;
      p: Patient;
      --For loop to get patient data input and insert into an array.
      begin
      while i < n loop
         Get(p.id);
         Get(sp);
         Get(p.sick);
         Get(sp);
         Get(p.test1);
         Get(sp);
         Get(p.test2);
         records(i) := p;
         i := i + 1;
         end loop;
   end GetInput;

   procedure CalcTotals is
      s, t1, t2: Integer;
      --Calculate total positive and negative tests for sick and health
      begin
      for I of records loop
      if t1 = 1 then
         --Increase Positive test totals
         pos1total := pos1total + 1;
         if records(I).sick = 1 then
            --Increase Positive Test 1
            pos1sick := pos1sick + 1;
         end if;
      else
         --Increase Negative test totals
         if records(I).sick = 0 then
            --Increase Neagtive Test 1
           neg1health := neg1health + 1;
         end if;
      end if;
      if records(I).test2 = 1 then
         --Increase Positive test totals
         pos2total := pos2total + 1;
         if records(I).sick = 1 then
            --Increase Positive Test 1
            pos2sick := pos2sick + 1;
         end if;
      else
         --Increase Negative test totals
         if records(I).sick = 0 then
            --Increase Neagtive Test 1
           neg2health := neg2health + 1;
         end if;
      end if;
     end loop;
   end CalcTotals;

   procedure CalcProb is
      --Function to calculate and output probabilities.
      begin
   test1pp := Float(pos1sick/pos1total);
   test1np := Float(neg1health/neg1total);
   test2pp := Float(pos2sick/pos2total);
   test2np := Float(neg1health/neg2total);
   end CalcProb;

   procedure Output is
      --Outputs
   begin
   Put("P(D | Pos1) = ");
   Put(test1pp);
   New_Line(1);
   Put("P(D | Pos2) = ");
   Put(test1np);
   New_Line(1);
   Put("P(H | Neg1) = ");
   Put(test2pp);
   New_Line(1);
   Put("P(H | Neg2) = ");
   Put(test2np);
   New_Line(1);
   if test1pp > test2pp and test1np > test2np then
      Put("Test 1 is better.");
   elsif test1pp < test2pp and test1np < test2np then
         Put("Test 2 is better.");
   else
         Put("Neither test is better.");
      end if;
   end Output;


begin


null;
end Adahw;


Program Halfpills;
{
Program: Halfpills
Author : Rajat Dodle
UIN: 653072303
Date: 11/16/2016
Subject: CSC 540 A GRS
Location: The same directory as the executable files for Free Pascal IDE.
Location of output file:C:\FPC\3.0.0\bin\i386-win32 please select the file  'dodle_pills.txt'
Purpose: This program is used to calculate the ratio of half pills in a bottle to the total number of pills in a bottle.
         50 full pills and 100 full pills are used to generate 10 sets of ratios. These sets of ratios are stored in 
         10 arrays for further analysis
		 }
	uses Crt;
	type
		Itt_50 = array [0..100] of real; 
		Itt_100 = array [0..200] of real;
	var
		a,i,j,k,l,ndays,hpills,fpills: integer;
		b: real;
		fpills_array, hpills_array: array of integer; {Arrays to store full pills and half pills}
		Itt_50_pills, Itt_1_50_pills, Itt_2_50_pills, Itt_3_50_pills, Itt_4_50_pills, Itt_5_50_pills: Itt_50;  {Arrays to store 50 pills itteration}
		Itt_100_pills, Itt_1_100_pills, Itt_2_100_pills, Itt_3_100_pills, Itt_4_100_pills, Itt_5_100_pills: Itt_100; {Arrays to store 100 pills itteration}

	function ResultArray(): Itt_50; {Function for getting ratios of 50 pills}
	begin
		ndays:=0; {number of days}
		fpills:=50;
		hpills:=0;
		setLength(fpills_array,50); {Initializing the length of full pill array to include 50 pills}
		for i:= 0 to 49 do
		begin
			fpills_array[i]:=1;	   {Filling the full pill array with 50 pills}
		end;

		ndays:=1;
		b:=hpills/(hpills+fpills); {Storing the ratio as a real number}
		setLength(fpills_array,fpills-1); {Changing the length of the array}
		fpills:=fpills-1;
		setLength(hpills_array,hpills+1); {Changing the length of the array}
		hpills:=hpills+1;
		hpills_array[0]:=1;
		Itt_50_pills[0]:=b;

		for j:=1 to 99 do
		begin
			if (Length(fpills_array) <> 0) and (Length(hpills_array) <> 0) then
			begin
				a:=random(2);  {a will be 1 or 0}
				if (a=1) then  {Condition for taking a full pill}
				begin
					ndays:=ndays+1;
					b:=hpills/(hpills+fpills);
					setLength(fpills_array,fpills-1);
					fpills:=fpills-1;
					setLength(hpills_array,hpills+1);
					hpills:=hpills+1;
					hpills_array[Length(hpills_array)-1]:=1;
					Itt_50_pills[j]:=b;
				end
				else  {Condition for half pill}
				begin
					b:=hpills/(hpills+fpills);
					setLength(hpills_array,hpills-1);
					hpills:=hpills-1;
					ndays:=ndays+1;
					Itt_50_pills[j]:=b;
				end
			end
			else if (Length(fpills_array) <> 0) and (Length(hpills_array) = 0) then  {half pill array will be zero}
			begin
				ndays:=ndays+1;
				b:=hpills/(hpills+fpills);
				setLength(fpills_array,fpills-1);
				fpills:=fpills-1;
				setLength(hpills_array,hpills+1);
				hpills:=hpills+1;
				hpills_array[Length(hpills_array)-1]:=1;
				Itt_50_pills[j]:=b;
			end
			else  {When full pill array is full}
			begin
				b:=hpills/(hpills+fpills);
				setLength(hpills_array,hpills-1);
				ndays:=ndays+1;
				hpills:=hpills-1;
				Itt_50_pills[j]:=b;
			end
		end;

		ResultArray:=Itt_50_pills; {Returning the result array of ratios}
	end;

	function ResultArray_100(): Itt_100; {Function for getting ratios of 100 pills}
	begin
		ndays:=0;
		fpills:=100;
		hpills:=0;
		setLength(fpills_array,100);

		for i:= 0 to 99 do
		begin
			fpills_array[i]:=1;	   {Filling the full pill array with 100  pills}
		end;

		ndays:=1;
		b:=hpills/(hpills+fpills); {Storing the ratio of pills as real number}
		setLength(fpills_array,fpills-1); {Changing the length of the array}
		fpills:=fpills-1;
		setLength(hpills_array,hpills+1); {Changing the length of the array}
		hpills:=hpills+1;
		hpills_array[0]:=1;
		Itt_100_pills[0]:=b;
		
		for j:=1 to 199 do
		begin
			if (Length(fpills_array) <> 0) and (Length(hpills_array) <> 0) then
			begin
				a:=random(2);  {'a' will be 1 or 0}
				if (a=1) then  {for full pill}
				begin
					ndays:=ndays+1;
					b:=hpills/(hpills+fpills);
					setLength(fpills_array,fpills-1);
					fpills:=fpills-1;
					setLength(hpills_array,hpills+1);
					hpills:=hpills+1;
					hpills_array[Length(hpills_array)-1]:=1;
					Itt_100_pills[j]:=b;
				end
				else
				begin
					b:=hpills/(hpills+fpills);
					setLength(hpills_array,hpills-1);
					hpills:=hpills-1;
					ndays:=ndays+1;
					Itt_100_pills[j]:=b;
				end
			end
			else if (Length(fpills_array) <> 0) and (Length(hpills_array) = 0) then
			begin
				ndays:=ndays+1;
				b:=hpills/(hpills+fpills);
				setLength(fpills_array,fpills-1);
				fpills:=fpills-1;
				setLength(hpills_array,hpills+1);
				hpills:=hpills+1;
				hpills_array[Length(hpills_array)-1]:=1;
				Itt_100_pills[j]:=b;
			end
			else {full pair array is empty}
			begin
				b:=hpills/(hpills+fpills);
				setLength(hpills_array,hpills-1);
				ndays:=ndays+1;
				hpills:=hpills-1;
				Itt_100_pills[j]:=b;
			end
		end;

		ResultArray_100:=Itt_100_pills;
	end;

	procedure Writetofile(option:integer); {Procedure for writing the ratios to a text file,}
	var filetype: Text;
	begin
		if (option=1) then {Writing Iteration 1 ratios for 50 pills}
		begin
			assign(filetype,'dodle_pills.txt'); {Writing to dodle_pills.txt file}
			rewrite(filetype);
			writeln(filetype,'Iteration 1 for 50 full pills');
			writeln(filetype,'------------------------------');
			writeln(filetype,'');
			for l:=0 to 99 do
			begin
				writeln(filetype,'Ratio of half pills to total pills on Day ',l+1,': ',Itt_1_50_pills[l]:1:5);
			end;
			writeln(filetype,'');
                        close(filetype);
		end
		else if (option=2) then {Writing Iteration 2 ratios for 50 pills}
		begin
                        assign(filetype,'dodle_pills.txt');
                        append(filetype);
			writeln(filetype,'Iteration 2 for 50 full pills');
			writeln(filetype,'------------------------------');
			writeln(filetype,'');
			for l:=0 to 99 do
			begin
				writeln(filetype,'Ratio of half pills to total pills on Day ',l+1,': ',Itt_2_50_pills[l]:1:5);
			end;
			writeln(filetype,'');
                        close(filetype);
		end
		else if (option=3) then {Writing Iteration 3 ratios for 50 pills}
		begin
                        assign(filetype,'dodle_pills.txt');
                        append(filetype);
			writeln(filetype,'Iteration 3 for 50 full pills');
			writeln(filetype,'------------------------------');
			writeln(filetype,'');
			for l:=0 to 99 do
			begin
		        writeln(filetype,'Ratio of half pills to total pills on Day ',l+1,': ',Itt_3_50_pills[l]:1:5);
			end;
			writeln(filetype,'');
                        close(filetype);
		end
		else if (option=4) then {Writing Iteration 4 ratios for 50 pills}
		begin
                        assign(filetype,'dodle_pills.txt');
                        append(filetype);
			writeln(filetype,'Iteration 4 for 50 full pills');
			writeln(filetype,'------------------------------');
			writeln(filetype,'');
			for l:=0 to 99 do
			begin
				writeln(filetype,'Ratio of half pills to total pills on Day ',l+1,': ',Itt_4_50_pills[l]:1:5);
			end;
			writeln(filetype,'');
                        close(filetype);
		end
		else if (option=5) then {Writing Iteration 5 ratios for 50 pills}
		begin
                        assign(filetype,'dodle_pills.txt');
                        append(filetype);
			writeln(filetype,'Iteration 5 for 50 full pills');
			writeln(filetype,'------------------------------');
			writeln(filetype,'');
			for l:=0 to 99 do
			begin
				writeln(filetype,'Ratio of half pills to total pills on Day ',l+1,': ',Itt_5_50_pills[l]:1:5);
			end;
			writeln(filetype,'');
			writeln(filetype,'******************************************************');
                        close(filetype);
		end
		else if (option=6) then {Writing Iteration 1 ratios for 100 pills}
		begin
                        assign(filetype,'dodle_pills.txt'); {Writing to dodle_pills.txt file}
                        append(filetype);
			writeln(filetype,'');
			writeln(filetype,'Iteration 1 for 100 full pills');
			writeln(filetype,'------------------------------');
			writeln(filetype,'');
			for l:=0 to 199 do
			begin
				writeln(filetype,'Ratio of half pills to total pills on Day ',l+1,': ',Itt_1_100_pills[l]:1:5);
			end;
			writeln(filetype,'');
                        close(filetype);
		end
		else if (option=7) then {Writing Iteration 2 ratios for 100 pills}
		begin
                        assign(filetype,'dodle_pills.txt');
                        append(filetype);
			writeln(filetype,'Iteration 2 for 100 full pills');
			writeln(filetype,'------------------------------');
			writeln(filetype,'');
			for l:=0 to 199 do
			begin
				writeln(filetype,'Ratio of half pills to total pills on Day ',l+1,': ',Itt_2_100_pills[l]:1:5);
			end;
			writeln(filetype,'');
                        close(filetype);
		end
		else if (option=8) then {Writing Iteration 3 ratios for 100 pills}
		begin
                        assign(filetype,'dodle_pills.txt');
                        append(filetype);
			writeln(filetype,'Iteration 3 for 100 full pills');
			writeln(filetype,'------------------------------');
			writeln(filetype,'');
			for l:=0 to 199 do
			begin
				writeln(filetype,'Ratio of half pills to total pills on Day ',l+1,': ',Itt_3_100_pills[l]:1:5);
			end;
			writeln(filetype,'');
                        close(filetype);
		end
		else if (option=9) then {Writing Iteration 4 ratios for 100 pills}
		begin
                        assign(filetype,'dodle_pills.txt');
                        append(filetype);
			writeln(filetype,'Iteration 4 for 100 full pills');
			writeln(filetype,'------------------------------');
			writeln(filetype,'');
			for l:=0 to 199 do
			begin
				writeln(filetype,'Ratio of half pills to total pills on Day ',l+1,': ',Itt_4_100_pills[l]:1:5);
			end;
			writeln(filetype,'');
                        close(filetype);
		end
		else {Writing Iteration 5 ratios for 100 pills}
		begin
                        assign(filetype,'dodle_pills.txt');
                        append(filetype);
			writeln(filetype,'Iteration 5 for 100 full pills');
			writeln(filetype,'------------------------------');
			writeln(filetype,'');
			for l:=0 to 199 do
			begin
				writeln(filetype,'Ratio of half pills to total pills on Day ',l+1,': ',Itt_5_100_pills[l]:1:5);
			end;
			writeln(filetype,'');
                        close(filetype);
		end
	end;

	begin
		Itt_1_50_pills:=ResultArray(); {Calling function for 50 pills}
		Randomize;
		Itt_2_50_pills:=ResultArray();
		Itt_3_50_pills:=ResultArray();
		Randomize;
		Itt_4_50_pills:=ResultArray();
		for l:=0 to 99 do
		begin
			Itt_5_50_pills[l]:=(Itt_1_50_pills[l]+Itt_2_50_pills[l]+Itt_3_50_pills[l]+Itt_4_50_pills[l])/4;
		end;
                Writetofile(1); { procedure}
                Writetofile(2);
                Writetofile(3);
                Writetofile(4);
                Writetofile(5);

		Itt_1_100_pills:=ResultArray_100(); {Calling function fro 100 pills}
		Randomize;
		Itt_2_100_pills:=ResultArray_100();
		Itt_3_100_pills:=ResultArray_100();
		Randomize;
		Itt_4_100_pills:=ResultArray_100();
		for l:=0 to 199 do
		begin
			Itt_5_100_pills[l]:=(Itt_1_100_pills[l]+Itt_2_100_pills[l]+Itt_3_100_pills[l]+Itt_4_100_pills[l])/4;
		end;

                Writetofile(6); {Calling procedure}
                Writetofile(7);
                Writetofile(8);
                Writetofile(9);
                Writetofile(10);
                writeln('The ratios have been written to "dodle_pills.txt" file. This file is located in the same directory where executable files are located.');
                writeln('For example, if free pascal 2.6.4 is installed, then the file is located in C:\FPC\2.6.4\bin\i386-win32 folder.');
                writeln('Please open the file dodle_pills.txt');
		writeln('Thank you.');
		writeln();
                readln();
end.
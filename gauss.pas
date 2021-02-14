program gauss;
const nmax=10;
type matrice=array[1..nmax,1..nmax] of real;
 vect=array[1..nmax] of real;
var a:matrice;
 s :vect;
 i,n:integer;
procedure citeste(var x:matrice; var t:integer);
var i, j: integer; f: text;
begin {citeste}
 assign (f, 'matrice.txt'); reset(f);
 readln(f, t);
for i:=1 to t do
begin
for j:=1 to t do read(f,x[i,j]);
readln(f, x [i,t+1]);
end;
close(f);
end; {citeste}
procedure direct(var x:matrice;t:integer);
 label linie_urmatoare;
 var i,j,k,l:integer; r:real;
 begin {direct}
 for i:=1 to t-1 do
 begin
 if x[i,i]=0 then
 begin
 k:=i;
 for j:=i+1 to n do if x[j,i]<>0 then k:=j;
 if k=i then goto linie_urmatoare
 else
 for j:=1 to t+1 do
 begin
 r:=x[i,j]; x[i,j]:=x[k,j]; x[k,j]:=r;
 end;
 end;
 for j:=i+1 to t do
 begin r:=-x[j,i]/x[i,i];
 for k:=i to t+1 do x[j,k]:=x[j,k]+x[i,k]*r;
 end;
 linie_urmatoare: end;
end; {direct}
procedure invers (var q:vect);
var i,j: integer;
s: real;
begin
for i:=n downto 1 do
begin
 s:=0;
 for j:=i+1 to n do s:=s+a[i,j]*q[j];
 if a [i,i]<>0 then q[i]:=(a[i,n+1] -s)/a[i,i] else q[i]:=0;
end;
end;
begin citeste(a,n);
 direct(a,n);
 invers(s);
 for i:=1 to n do writeln('x[',i,']=',s[i]:0:3);
 readln();
end.

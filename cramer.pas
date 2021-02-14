type matrice=array[1..10,1..10] of real;
tab=array[1..10] of real;
var a:matrice;b, sol:tab;
i,j,n,p:integer;
de:real;
f:text;
function cdet(x:matrice; t:integer):real;
 var i,j,k:integer;
 s:real; minor:matrice;
 begin
 if t=1 then cdet:=x[1,1] {caz elementar}
 else begin
 s:=0;
 for k:=1 to t do
 begin
 for i:=1 to t-1 do
 for j:=1 to k-1 do
 minor[i,j]:=x[i+1,j];
 for i:=1 to t-1 do
 for j:=k to t-1 do
 minor[i,j]:=x[i+1,j+1];
 if odd(k) then s:=s+x[1,k]*cdet(minor, t-1)
 else s:=s-x[1,k]*cdet(minor, t-1);
 end;
 cdet:=s;
 end;
 end;
 function transforma(x:matrice;t,l:integer):real;
var i : integer;
begin for i:=1 to t do x[i,l]:=b[i];
 transforma:=cdet(x,t);
end;
 begin
{assign(f,'Matrice.txt');
 reset(f);}
 readln(n);
 for i:=1 to n do begin
 for j:=1 to n do read(a[i,j]);
 readln(b[i]);
 end;
 writeln('Matricea A');
 for i:=1 to n do begin

 for j:=1 to n do
 write(a[i,j],'  ');
 writeln(b[i]);
 end;
 writeln;
 writeln('det(a)=', cdet(a,n));
{close(f);}
de:=cdet(a,n);
 if de<>0 then
 begin for p:=1 to n do sol[p]:= transforma(a,n,p)/de;
 for p:=1 to n do writeln('x[',p,']=',sol[p]:0:3);
 end
 else writeln('Calcul imposibil');

   readln();
 end.

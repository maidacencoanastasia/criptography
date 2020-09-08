const n=7;
var s,s1:string;
    a:array[1..n,1..n] of char;
    r,c:char;
    i,j,k:byte;
begin
//s:='ПРИКЛАДНАЯ МАТЕМАТИКА ';
writeln('Исходная строка');
readln(s);
writeln;
for i:=2 to n do
 begin
  a[1,i]:=chr(ord(i)+180);// +- цифра для кодированных символов
  a[i,1]:=chr(ord(i)+180);
 end;
c:='А';
k:=1;
for i:=2 to n do
for j:=2 to n do
 begin
  a[i,j]:=c;
  inc(c);
  inc(k);
  if k>32 then  c:=' ';
 end;
a[1,1]:=' ';
a[n,4]:='.';
a[n,5]:=',';
a[n,6]:='-';
a[n,7]:=' ';
writeln('Матрица шифрования');
for i:=1 to n do
 begin
  for j:=1 to n do
  write(a[i,j]:2);
  writeln;
 end;
s1:='';
for i:=1 to length(s) do
for j:=2 to n do
for k:=2 to n do
if a[j,k]=s[i] then s1:=s1+a[j,1]+a[1,k];
writeln;
writeln('Зашифрованная строка');
write(s1);
end.
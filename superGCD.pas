const
  mm=1000000;
type
  number=array[0..2003] of longint;
var
  s:ansistring;
  a,b:number;
  two,k:longint;

procedure print(a:number);
var
  i:longint;
begin
  write(a[a[0]]);
  for i:=a[0]-1 downto 1 do
  begin
    if a[i]<100000 then
      write(0);
    if a[i]<10000 then
      write(0);
    if a[i]<1000 then
      write(0);
    if a[i]<100 then
      write(0);
    if a[i]<10 then
      write(0);
    write(a[i]);
  end;
  writeln;
end;

procedure divide(var a:number;k:longint);
var
  x,i:longint;
begin
  x:=0;
  for i:=a[0] downto 1 do
  begin
    x:=x+a[i];
    a[i]:=x div k;
    x:=(x mod k)*mm;
  end;
  while (a[a[0]]=0) and (a[0]>0) do
    a[0]:=a[0]-1;
end;

procedure change(s:ansistring;var a:number);
var
  k,i:longint;
begin
  k:=length(s) mod 6;
  a[0]:=length(s) div 6+ord(k>0);
  if k>0 then
  begin
    val(copy(s,1,k),a[a[0]]);
    for i:=a[0]-1 downto 1 do
      val(copy(s,k+1+(a[0]-i-1)*6,6),a[i]);
  end
  else
    for i:=a[0] downto 1 do
      val(copy(s,1+(a[0]-i)*6,6),a[i]);
end;

function larger(var a,b:number):longint;
var
  i:longint;
begin
  if (a[0]<>b[0]) then
    exit(ord(a[0]>b[0]));
  for i:=a[0] downto 1 do
    if a[i]>b[i] then
      exit(1)
    else if a[i]<b[i] then
      exit(0);
    exit(2);
end;

procedure minus(var a,b:number);
var
  i:longint;
begin
  for i:=1 to a[0] do
  begin
    if a[i]<b[i] then
    begin
      a[i]:=a[i]+mm;
      a[i+1]:=a[i+1]-1;
    end;
    a[i]:=a[i]-b[i];
  end;
  while (a[a[0]]=0) and (a[0]>0) do
    a[0]:=a[0]-1;
end;

procedure multiply(var a:number;k:longint);
var
  i,x:longint;
begin
  x:=0;
  for i:=1 to a[0] do
  begin
    x:=x+a[i]*k;
    a[i]:=x mod mm;
    x:=x div mm;
  end;
  if (x>0) then
  begin
    a[0]:=a[0]+1;
    a[a[0]]:=x;
  end;
end;

begin
  readln(s);
  change(s,a);
  readln(s);
  change(s,b);
  for two:=0 to maxlongint do
    if odd(a[1]) or (odd(b[1])) then
      break
    else
    begin
      divide(a,2);
      divide(b,2);
    end;
  while true do
  begin
    k:=larger(a,b);
    if k=2 then
      break
    else if k=1 then
      minus(a,b)
    else
      minus(b,a);
    while not odd(a[1]) do
      divide(a,2);
    while not odd(b[1]) do
      divide(b,2);
  end;
  for k:=1 to two do
    multiply(a,2);
  print(a);
end.

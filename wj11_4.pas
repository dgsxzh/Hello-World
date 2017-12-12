program wj11_4(input,output,f1);
var f1:text;
    a,b,c:integer;
begin
  assign(f1,'f1.dat');
  append(f1);
  for a:=11 to 15 do
    write(f1,a,' ');
  close(f1);
  reset(f1);
  for a:=1 to 15 do
  begin
    read(f1,b);
    c:=c+b;
  end;
  write(c);
  close(f1);
end.

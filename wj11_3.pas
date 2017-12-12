program wj11_3(input,output,f1);
var f1:text;
    a,b,c:integer;
begin
  assign(f1,'f1.dat');
  reset(f1);
  for a:=1 to 10 do
  begin
    read(f1,b);
    write(b,' ');
    c:=c+b;
  end;
  write(c);
  close(f1);
end.
program wj11_1(input,output,f1);
var f1:text;
    a:integer;
begin
  assign(f1,'f1.dat');
  rewrite(f1);
  for a:=1 to 10 do
    write(f1,a,' ');
  close(f1);
end.

program wj11_2(input,output,sj);
var sj:text;
    a,b,c:integer;
begin
  assign(sj,'sj.in');
  rewrite(sj);
  randomize;
  for a:=1 to 6 do
  begin
    write(sj,random(100),' ');
    if a mod 3=0 then writeln(sj);
  end;
  close(sj);
end.


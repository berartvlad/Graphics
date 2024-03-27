unit ToolsString;

interface
var
  StK:string;
  StA:string;
  StU:string;
  StL:string;

function UpCaseR (s:char):char;
function LowCaseR (s:char):char;
function UpperCaseR(st:string):string;
function LowerCaseR(st:string):string;
function KirToLat(st:string):string;
function LatToKir(st:string):string;
function translit(st:string):string;
function CompStrings(st1,st2:string):real;
implementation
function UpCaseR(s:char):char;
var
  p:byte;
begin
  p:=pos(s,StL);
  if p<>0 then result:=StU[p] else Result:=s;
end;

function LowCaseR(s:char):char;
var
  p:byte;
begin
  p:=pos(s,StU);
  if p<>0 then result:=StL[p] else Result:=s;
end;

function UpperCaseR(st:string):string;
var
  p:byte;
  stv:string;
  i:word;
begin
  stv:='';
  for i:=1 to length(st) do begin
    p:=pos(st[i],StL);
    if p<>0 then stv:=stv+StU[p] else stv:=stv+st[i];
  end;
  Result:=stv;
end;
function LowerCaseR(st:string):string;
var
  p:byte;
  stv:string;
  i:word;
begin
  stv:='';
  for i:=1 to length(st) do begin
    p:=pos(st[i],StU);
    if p<>0 then stv:=stv+StL[p] else stv:=stv+st[i];
  end;
  Result:=stv;
end;

function KirToLat(st:string):string;
var
  p:byte;
  stv:string;
  i:word;
begin
  stv:='';
  for i:=1 to length(st) do begin
    p:=pos(st[i],StK);
    if p<>0 then stv:=stv+StA[p] else stv:=stv+st[i];
  end;
  Result:=stv;
end;
function LatToKir(st:string):string;
var
  p:byte;
  stv:string;
  i:word;
begin
  stv:='';
  for i:=1 to length(st) do begin
    p:=pos(st[i],StA);
    if p<>0 then stv:=stv+StK[p] else stv:=stv+st[i];
  end;
  Result:=stv;
end;
function CompStrings(st1,st2:string):real;
var stv1,stv2:string;
  i:integer;
  k,o:integer;

begin
  stv1:=UpperCaseR(KirToLat(st1));
  stv2:=UpperCaseR(KirToLat(st2));
  if length(stv1)<3 then
    if stv1=stv2 then result:=100
    else result:=0
  else begin
    k:=0;
    o:=0;
    for i:=1 to length(stv1)-2 do begin
      inc(k);
      if pos(copy(stv1,i,3),stv2)<>0 then inc(o);
    end;
    result:=o/k*100;
  end;
end;

function translit(st:string):string;
var
  s1,s2,s:string;
  i,p:word;
begin
  s:='';
  for i:=1 to length(st) do begin
    case st[i] of
      '�':s:=s+'a';
      '�':s:=s+'b';
      '�':s:=s+'v';
      '�':s:=s+'g';
      '�':s:=s+'d';
      '�':s:=s+'e';
      '�':s:=s+'e';
      '�':s:=s+'zh';
      '�':s:=s+'z';
      '�':s:=s+'i';
      '�':s:=s+'j';
      '�':s:=s+'k';
      '�':s:=s+'l';
      '�':s:=s+'m';
      '�':s:=s+'n';
      '�':s:=s+'o';
      '�':s:=s+'p';
      '�':s:=s+'r';
      '�':s:=s+'s';
      '�':s:=s+'t';
      '�':s:=s+'u';
      '�':s:=s+'f';
      '�':s:=s+'kh';
      '�':s:=s+'c';
      '�':s:=s+'ch';
      '�':s:=s+'sh';
      '�':s:=s+'sch';
      '�':s:=s+'''';
      '�':s:=s+'y';
      '�':s:=s+'''';
      '�':s:=s+'e';
      '�':s:=s+'yu';
      '�':s:=s+'ya';
      '�':s:=s+'A';
      '�':s:=s+'B';
      '�':s:=s+'V';
      '�':s:=s+'G';
      '�':s:=s+'D';
      '�':s:=s+'E';
      '�':s:=s+'E';
      '�':s:=s+'Zh';
      '�':s:=s+'Z';
      '�':s:=s+'I';
      '�':s:=s+'J';
      '�':s:=s+'K';
      '�':s:=s+'L';
      '�':s:=s+'M';
      '�':s:=s+'N';
      '�':s:=s+'O';
      '�':s:=s+'P';
      '�':s:=s+'R';
      '�':s:=s+'S';
      '�':s:=s+'T';
      '�':s:=s+'U';
      '�':s:=s+'F';
      '�':s:=s+'Kh';
      '�':s:=s+'C';
      '�':s:=s+'Ch';
      '�':s:=s+'Sh';
      '�':s:=s+'Sch';
      '�':s:=s+'''';
      '�':s:=s+'Y';
      '�':s:=s+'''';
      '�':s:=s+'E';
      '�':s:=s+'Yu';
      '�':s:=s+'Ya';
      else s:=s+st[i];
    end;
  end;
  Result:=s;
end;
initialization
  begin
    StK:='��������������������������������޸��������������������������������';
    StA:='~QWERTYUIOP{}ASDFGHJKL:"ZXCVBNM<>`qwertyuiop[]asdfghjkl;''zxcvbnm,.';
    StU:='ABCDEFGHIJKLMNOPQRSTUVWXYZ���������������������������������';
    StL:='abcdefghijklmnopqrstuvwxyz���������������������������������';
  end;
end.


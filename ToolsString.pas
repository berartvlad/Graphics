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
      'à':s:=s+'a';
      'á':s:=s+'b';
      'â':s:=s+'v';
      'ã':s:=s+'g';
      'ä':s:=s+'d';
      'å':s:=s+'e';
      '¸':s:=s+'e';
      'æ':s:=s+'zh';
      'ç':s:=s+'z';
      'è':s:=s+'i';
      'é':s:=s+'j';
      'ê':s:=s+'k';
      'ë':s:=s+'l';
      'ì':s:=s+'m';
      'í':s:=s+'n';
      'î':s:=s+'o';
      'ï':s:=s+'p';
      'ğ':s:=s+'r';
      'ñ':s:=s+'s';
      'ò':s:=s+'t';
      'ó':s:=s+'u';
      'ô':s:=s+'f';
      'õ':s:=s+'kh';
      'ö':s:=s+'c';
      '÷':s:=s+'ch';
      'ø':s:=s+'sh';
      'ù':s:=s+'sch';
      'ü':s:=s+'''';
      'û':s:=s+'y';
      'ú':s:=s+'''';
      'ı':s:=s+'e';
      'ş':s:=s+'yu';
      'ÿ':s:=s+'ya';
      'À':s:=s+'A';
      'Á':s:=s+'B';
      'Â':s:=s+'V';
      'Ã':s:=s+'G';
      'Ä':s:=s+'D';
      'Å':s:=s+'E';
      '¨':s:=s+'E';
      'Æ':s:=s+'Zh';
      'Ç':s:=s+'Z';
      'È':s:=s+'I';
      'É':s:=s+'J';
      'Ê':s:=s+'K';
      'Ë':s:=s+'L';
      'Ì':s:=s+'M';
      'Í':s:=s+'N';
      'Î':s:=s+'O';
      'Ï':s:=s+'P';
      'Ğ':s:=s+'R';
      'Ñ':s:=s+'S';
      'Ò':s:=s+'T';
      'Ó':s:=s+'U';
      'Ô':s:=s+'F';
      'Õ':s:=s+'Kh';
      'Ö':s:=s+'C';
      '×':s:=s+'Ch';
      'Ø':s:=s+'Sh';
      'Ù':s:=s+'Sch';
      'Ü':s:=s+'''';
      'Û':s:=s+'Y';
      'Ú':s:=s+'''';
      'İ':s:=s+'E';
      'Ş':s:=s+'Yu';
      'ß':s:=s+'Ya';
      else s:=s+st[i];
    end;
  end;
  Result:=s;
end;
initialization
  begin
    StK:='¨ÉÖÓÊÅÍÃØÙÇÕÚÔÛÂÀÏĞÎËÄÆİß×ÑÌÈÒÜÁŞ¸éöóêåíãøùçõúôûâàïğîëäæıÿ÷ñìèòüáş';
    StA:='~QWERTYUIOP{}ASDFGHJKL:"ZXCVBNM<>`qwertyuiop[]asdfghjkl;''zxcvbnm,.';
    StU:='ABCDEFGHIJKLMNOPQRSTUVWXYZ¨ÉÖÓÊÅÍÃØÙÇÕÚÔÛÂÀÏĞÎËÄÆİß×ÑÌÈÒÜÁŞ';
    StL:='abcdefghijklmnopqrstuvwxyz¸éöóêåíãøùçõúôûâàïğîëäæıÿ÷ñìèòüáş';
  end;
end.


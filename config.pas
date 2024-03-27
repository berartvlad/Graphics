unit config;

interface
uses inifile, classes, windows;
var
  PGroups:String;
  PDataBase:String;
  PConfig:String;
  PJournal:String;
  JournalName:string;
  PReport:string;
  DBFileName:String;
  VidZan:integer;
  DataBase, tems,  prepody, discip, UchGod,kurs,gruppa, Studenty,modul, Journal:TStringList;

function GetVal(st:string; index:integer):string;
function NormChislo(st:string):string;
function NormStr(st:string):string;
Procedure exec(CMDLN:string);
function GetValFromTable(PTable:string; Col,Row:integer):String;
function StrReplace(Source, AAAA, str:string):string;//Âîçâğàùàåò çàäàííóş ñòğîêó ñ çàìåíåííûì êóñêîì
procedure CopyStrListToStrings(from:TStringList; k:TStrings);
function GetCompName: String;
function GetUsrName: String;

implementation

uses SysUtils;

function GetVal(st:string; index:integer):string;
var stv:string;
  i:integer;
begin
  stv:=st+#9;
  for i:=1 to index do
    if pos(#9,stv)<>0 then
      delete(stv,1,pos(#9,stv)) else stv:='';
  if stv<>'' then
    stv:=copy(stv,1,pos(#9,stv)-1);
  GetVal:=stv;
end;
function NormChislo(st:string):string;
var stv:string;
  i:integer;
begin
  stv:='';
  if (st<>'')and(st[1]='-') then stv:='-';
  for i:=1 to length(st) do begin
    if (st[i]>='0') and (st[i]<='9') then stv:=stv+st[i];
    if pos(st[i],'.,')<>0 then
      if (pos(',',stv)=0)and(stv<>'') then stv:=stv+',';
  end;
  if stv='' then stv:='0';
  NormChislo:=stv;
end;
Procedure exec(CMDLN:string) ;
var cmdl:PChar;
begin
  new(cmdl);
  cmdl:=PChar('CMD /c "'+CMDLN);
  WinExec(CMDl,SW_SHOWNORMAL);
end;
function GetValFromTable(PTable:string; Col,Row:integer):String;
var table:TStringList;
begin
  Table:=TStringList.Create;
  Table.LoadFromFile(PTable);
  GetValFromTable:=GetVal(table[Row],Col);
  table.destroy;
end;
function StrReplace(Source, AAAA, str:string):string;
var stv:string;
begin
  stv:=Source;
  if pos(AAAA,stv)<>0 then begin
    insert(str, stv, pos(AAAA,stv));
    delete(stv,pos(AAAA,stv),length(AAAA));
  end;
  StrReplace:=stv;
end;
procedure CopyStrListToStrings(from:TStringList; k:TStrings);
var tmp:TStringList;
  i:integer;
begin
  k.Clear;
  tmp:=TStringList.Create;
  for i:=0 to from.Count-1 do begin
    if (from[i]<>'') and (from[i][1]<>'?') then
      tmp.Add(from[i]);
  end;
  tmp.Sort;
  for i:=0 to tmp.Count-1 do
    k.Add(tmp[i]);
end;
function NormStr(st:string):string;
var i:integer;
  DopustSim:string;//äîïóñòèìûå ñèìâîëû
  res:string;//ğåçóëüòàò
begin
  DopustSim:=' .,/?!@#$%^&*()_+|-=\¹;:"`''0123456789QWERTYUIOPASDFGHJKLZXCVBNMqwertyuiopasdfghjklzxcvbnm¨ÉÖÓÊÅÍÃØÙÇÕÚÔÛÂÀÏĞÎËÄÆİß×ÑÌÈÒÜÁŞ¸éöóêåíãøùçõúôûâàïğîëäæıÿ÷ñìèòüáş';
  for i:=1 to length(st) do
    if pos(st[i],DopustSim)<>0 then
      res:=res+st[i];
  NormStr:=res;
end;
function GetCompName: String;
var
  Buffer: array[0..Pred(MAX_COMPUTERNAME_LENGTH+1)] of Char;
  Size: cardinal;
begin
  Size := SizeOf(Buffer);
  Windows.GetComputerName(Buffer, Size);
  Result := Buffer;
end;
function GetUsrName: String;
var
  Buffer: array[0..Pred(MAX_COMPUTERNAME_LENGTH+1)] of Char;
  Size: cardinal;
begin
  Size := SizeOf(Buffer);
  Windows.GetUserName(Buffer, Size);
  Result := Buffer;
end;

initialization

finalization
end.

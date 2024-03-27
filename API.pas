unit API;

interface
uses SysUtils, classes, windows;
var ReciveCommands:TStringList;
  NCommand:Integer;
function GetListExeFiles(path:string):TStringList;
implementation
function GetListExeFiles(path:string):TStringList;
var ff:TSearchrec;
begin
  Result:=TStringList.Create;
  if FindFirst(path+'\*.exe',faAnyFile, ff)=0 then
  repeat
    Result.Add(ff.Name);
  until FindNext(ff) <> 0;
  SysUtils.FindClose(ff);
end;
function SendMessage(st:string):Boolean;
begin

end;
initialization
  ReciveCommands:=TStringList.Create;
  NCommand:=-1;
end.

/////////////////////////////////////////////////////////////////////////////
//Ver 1.1
////////////////////////////////////////////////////////////////////////////

unit INIFILE;

interface
  uses
    Classes;

  Function GetValue(FName, ValID:string):string;
  Procedure SetValue(FName, ValID, value:string);

implementation
uses SysUtils, config;
  Function UpperCaseR(st:string):string;
  var s1,s2,s:string;
  i,p:word;
  begin
    s1:='QWERTYUIOPASDFGHJKLZXCVBNM¨ÉÖÓÊÅÍÃØÙÇÕÚÔÛÂÀÏĞÎËÄÆİß×ÑÌÈÒÜÁŞ';
    s2:='qwertyuiopasdfghjklzxcvbnm¸éöóêåíãøùçõúôûâàïğîëäæıÿ÷ñìèòüáş';
    s:='';
    for i:=1 to length(st) do begin
      p:=pos(st[i],s2);
      if p<>0 then s:=s+s1[p]
      else s:=s+st[i];
    end;
    UpperCaseR:=s;
  end;

  Function GetValue(FName, ValID:string):string;
  var
    IniFile:TStringList;
    VID, Res:String;
    i:integer;
  begin
    IniFile:=TStringList.Create;
    if FileExists(FName+'.INI') then
      IniFile.LoadFromFile(FName+'.INI')
    else
    if FileExists(FName) then
      IniFile.LoadFromFile(FName);
    res:='';
    VID:=UpperCaseR(ValID)+'=';
    i:=0;
    For i:=0 to IniFile.Count-1 do begin
      if Pos(vid, UpperCaseR(IniFile[i]))<>0 then break;
    end;
    if (i<>IniFile.Count)and(IniFile.Count<>0) then begin
      res:=IniFile[i];
      delete(res,1,length(vid));
    end;
    GetValue:=res;
    IniFile.Destroy;
  end;
  Procedure SetValue(FName, ValID, value:string);
  var
    IniFile:TStringList;
    NotIniFile:Boolean;//Ini-ôàéë ëè?
    VID:String;
    i:integer;
  begin
    IniFile:=TStringList.Create;
    if FileExists(FName+'.INI') then begin
      IniFile.LoadFromFile(FName+'.INI');
      NotIniFile:=False;
    end else
    if FileExists(FName) then begin
      IniFile.LoadFromFile(FName);
      NotIniFile:=True;
    end;
    VID:=UpperCaseR(ValID)+'=';
    For i:=0 to IniFile.Count-1 do begin
      if Pos(vid, IniFile[i])<>0 then
        break;
    end;
    if i<>IniFile.Count then
      IniFile[i]:=VID+value
    else
      IniFile.Add(VID+value);
    if NotIniFile then IniFile.SaveToFile(FName)
    else IniFile.SaveToFile(FName+'.INI');
    IniFile.Destroy;
  end;
end.



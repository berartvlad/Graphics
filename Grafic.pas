unit Grafic;
interface
uses Classes, ToolsString, Dialogs;
type
  TXY=record
    x,y:Extended;
  end;
  TGrafic=class(TObject)
    NameX,NameY:string;
    GrafName:string;
    GrafColor:LongWord;
    Data:array of TXY;
    TData:TStringList;
    Selected:Boolean;
    SelectedX1, SelectedX2:Extended;
    show:Boolean;
    count:Integer;
    constructor create;
    function GetValue(ValID:string):string;
    Procedure SetValue(ValID, value:string);
    function LoadFromFile(FileName:string):Boolean;
    procedure Delete (index:Integer);
    function GetMaxX:Extended;
    function GetMaxY:Extended;
    function GetMinX:Extended;
    function GetMinY:Extended;
    procedure SetMaxX(x:Extended);
    procedure SetMaxY(y:Extended);
    procedure SetMinX(x:Extended);
    procedure SetMinY(y:Extended);
    procedure sort;
    procedure AddPoint(xy:TXY);
    //Добавление, вычитание, умножение на указанное число
    procedure MulX(x:Extended);
    procedure MulY(y:Extended);
    procedure DivX(x:Extended);
    procedure DivY(y:Extended);
    procedure SubX(x:Extended);
    procedure SubY(y:Extended);
    procedure AddX(x:Extended);
    procedure AddY(y:Extended);
    //математические операции между графиками
    function MulG(Grafic:TGrafic):TGrafic;
    function divG(Grafic:TGrafic):TGrafic;
    function SubG(Grafic:TGrafic):TGrafic;
    function AddG(Grafic:TGrafic):TGrafic;
    function CopyGraf:TGrafic;
    function GetX(index:Integer):Extended;
    function GetY(index:Integer):Extended;
    procedure SetX(index:Integer; val:extended);
    procedure SetY(index:Integer; val:extended);
    function GetYForX(x:extended):Extended;//Фукция возвращает значение Y для точки X
    function GetIndexForXY(x,y:Extended):Integer;//Возврат номера для пары (Наиболее близкие к заданным)
    function GetSelectedGraf:TGrafic;
    function SaveToFile(FileName:string):Boolean;
    function ExportToTXT(FileName:string):Boolean;
    destructor destroy;
  end;
  function NormChislo(st:string):string;
implementation
uses SysUtils, Math;
//Вспомогательные// функци
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
Function UpperCaseR(st:string):string;
var s1,s2,s:string;
i,p:word;
begin
  s1:='QWERTYUIOPASDFGHJKLZXCVBNMЁЙЦУКЕНГШЩЗХЪФЫВАПРОЛДЖЭЯЧСМИТЬБЮ';
  s2:='qwertyuiopasdfghjklzxcvbnmёйцукенгшщзхъфывапролджэячсмитьбю';
  s:='';
  for i:=1 to length(st) do begin
    p:=pos(st[i],s2);
    if p<>0 then s:=s+s1[p]
    else s:=s+st[i];
  end;
  UpperCaseR:=s;
end;
function NormChislo(st:string):string;
var stv:string;
  i:integer;
begin
  stv:='';
  for i:=1 to length(st) do begin
    if (st[i]>='0') and (st[i]<='9') then stv:=stv+st[i];
    if pos(st[i],'.,')<>0 then stv:=stv+',';
    if (st[i]='-') then stv:=stv+st[i];
    if (st[i]='E') then stv:=stv+st[i];
  end;
  if stv='' then stv:='0';
  NormChislo:=stv;
end;

//Реализация класса
  Function TGrafic.GetValue(ValID:string):string;
  var
    VID, Res:String;
    i:integer;
  begin
    res:='';
    VID:=UpperCaseR(ValID)+'=';
    i:=0;
    For i:=0 to TData.Count-1 do begin
      if Pos(vid, UpperCaseR(TData[i]))<>0 then break;
    end;
    if (i<>TData.Count)and(TData.Count<>0) then begin
      res:=TData[i];
      System.delete(res,1,length(vid));
    end;
    GetValue:=res;
  end;

  Procedure TGrafic.SetValue(ValID, value:string);
  var
    VID:String;
    i:integer;
  begin
{    VID:=UpperCaseR(ValID)+'=';
    For i:=0 to Data.Count-1 do begin
      if Pos(vid, Data[i])<>0 then
        break;
    end;
    if i<>Data.Count then
      Data[i]:=VID+value
    else}
  end;
  procedure TGrafic.sort;
  var
    VData:array of TXY;
    i, addi, mini:Integer;
    minx:Extended;
  begin
    SetLength(VData, count);
    addi:=0;
    if Count>0 then begin
      while Count>0 do begin
        mini:=0;
        minx:=GetX(0);
        for i:=1 to Count-1 do begin
          if data[i].x<minx then begin
            mini:=i;
            minx:=data[i].x;
          end;
        end;
        VData[addi]:=Data[mini];
        Inc(addi);
        Delete(mini);
      end;
    end;
    SetLength(Data, Addi);
    for i:=0 to addi-1 do
      data[i]:=VData[i];
    count:=addi;
    SetLength(VData, 0);
  end;
  procedure TGrafic.addPoint(xy:TXY);
  var ii:Integer;
    i:Integer;
  begin
    Inc(count);
    asm
      mov ii,0;
    end;
//    ii:=0;
    SetLength(Data, count);
    for ii:=0 to count-2 do
      if Data[ii].x> xy.x then Break;

    for i:=count-2 downto ii do
      Data[i+1]:=Data[i];
    Data[ii]:=xy;
  end;

  constructor TGrafic.create;
  var r,g,b:Byte;
  begin
    NameX:='X';
    NameY:='Y';
    GrafName:='NoName';
    //Генераия случайного светлого цвета
    r:=Random(156)+100;
    g:=Random(156)+100;
    b:=Random(156)+100;
    GrafColor:=Random(256*256*b+256*g+r);
    SetLength(Data,0);
    Selected:=False;
    SelectedX1:=0;
    SelectedX2:=0;
    show:=true;
    TData:=TStringList.Create;
    count:=0;
{    Data.Add('VER=GRAFIC1.1');
    Data.Add('NameX=X');
    Data.Add('NameY=Y');
    Data.Add('GrafName=NoName');
    Data.Add('GrafColor='+IntToStr(GrafColor));
    Data.Add('Selected=False');
    Data.Add('SelectedX1=0');
    Data.Add('SelectedX2=0');
    Data.Add('DATA');}
  end;
  //Удаление указанного индекса из графика
  procedure TGrafic.Delete (index:Integer);
  var i:Integer;
  begin
    if (index>=0)and(index< count) then
    begin
      for i:=index to count-2 do
        Data[i]:=Data[i+1];
      Dec(count);
      SetLength(Data, count);
    end;
  end;

  function TGrafic.LoadFromFile(FileName:string):Boolean;
  var i:Integer;
    stv:string;
  begin
    if FileExists(FileName) then begin
      Result:=True;
      //Загружается файл программы
      TData.LoadFromFile(FileName);
      //Сначала загружаем параметры
      if Pos('GRAFIC1.', GetValue('VER'))<>0 then begin
        NameX:=GetValue('NameX');
        NameY:=GetValue('NameY');
        GrafName:=GetValue('GrafName');
        GrafColor:=StrToInt(GetValue('GrafColor'));
        Selected:=GetValue('Selected')='-1';
        SelectedX1:=StrToFloat(GetValue('SelectedX1'));
        SelectedX2:=StrToFloat(GetValue('SelectedX2'));
        while (TData.Count>0)and(TData[0]<>'DATA') do TData.Delete(0);
        if (TData.Count>0) then TData.Delete(0);
      end else begin
      //Загружается другой файл. Обрабатываем как текстовый.

      end;
      count:=TData.Count;
      SetLength(Data, count);
      for i:=0 to Count-1 do begin
        stv:=TData[i]+#9;
        Data[i].x:=StrToFloat(NormChislo(Copy(stv,1,Pos(#9,stv)-1)));
        System.Delete(stv,1,Pos(#9,stv));
        Data[i].y:=StrToFloat(NormChislo(stv));
      end;
      sort;
    end else begin
      Result:=False;
    end;

  end;
  function TGrafic.GetX(index:Integer):Extended;
  begin
    if (index>=0)and(index<Count) then
    Result:=Data[index].x;
  end;
  function TGrafic.GetY(index:Integer):Extended;
  begin
    if (index>=0)and(index<Count) then
      Result:=Data[index].y;
  end;
  procedure TGrafic.SetX(index:Integer; val:extended);
  begin
    if (index>=0)and(index<Count) then begin
      Data[index].x:=val;
    end;
  end;
  procedure TGrafic.SetY(index:Integer; val:extended);
  begin
    if (index>=0)and(index<Count) then begin
      Data[index].y:=val;
    end;
  end;
  function TGrafic.GetMaxX:Extended;
  begin
    if Count>0 then
      Result:=Data[count-1].x
    else Result:=0
  end;
  function TGrafic.GetMaxY:Extended;
  var i:Integer;
    MaxY:Extended;
  begin
    if Count>0 then
      MaxY:=data[0].y
    else MaxY:=0;
    for i:=1 to Count-1 do
      if Data[i].y>MaxY then
        MaxY:=Data[i].y;
    Result:=MaxY;
  end;
  function TGrafic.GetMinX:Extended;
  begin
    if Count>0 then
      Result:=Data[0].x
    else Result:=0
  end;
  function TGrafic.GetMinY:Extended;
  var i:Integer;
    MinY:Extended;
  begin
    if Count>0 then
      MinY:=Data[0].y
    else MinY:=0;
    for i:=1 to Count-1 do
      if Data[i].y<MinY then begin
        MinY:=Data[i].y;
      end;
    Result:=MinY;
  end;
  procedure TGrafic.SetMaxX(x:Extended);
  var
    K,MinX1:Extended;
  begin
    if Count>0 then begin
      MinX1:=GetMinX;
      x:=x-MinX1;
      SubX(MinX1);
      k:=x/GetMaxX;//Расчет коэффициента растяжения
      MulX(k);
      AddX(MinX1);
    end;
  end;
  procedure TGrafic.SetMaxY(y:Extended);
  var
    K,MinY1:Extended;
  begin
    if Count>0 then begin
      MinY1:=GetMinY;
      y:=y-MinY1;
      SubY(MinY1);
      k:=y/GetMaxY;//Расчет коэффициента растяжения
      MulY(k);
      AddY(MinY1);
    end;
  end;
  procedure TGrafic.SetMinX(x:Extended);
  var
    K,MaxX1:Extended;
  begin
    if Count>0 then begin
      MaxX1:=GetMaxX;
      x:=x-MaxX1;
      SubX(MaxX1);
      k:=x/GetMinX;//Расчет коэффициента растяжения
      MulX(k);
      AddX(MaxX1);
    end;
  end;
  procedure TGrafic.SetMinY(y:Extended);
  var
    K,MaxY1:Extended;
  begin
    if Count>0 then begin
      MaxY1:=GetMaxY;
      y:=y-MaxY1;
      SubY(MaxY1);
      k:=y/GetMinY;//Расчет коэффициента растяжения
      MulY(k);
      AddY(MaxY1);
    end;
  end;
  //Получения индеска для указанной пары x-y
  function TGrafic.GetIndexForXY(x,y:Extended):Integer;
  var i:Integer;
    mini:Integer;
    min,mmin,xg,yg:Extended;
  begin
    mini:=-1;
    if Count>0 then begin
      i:=0;
      xg:=Data[i].x;
      yg:=Data[i].y;
      min:=(x-xg)*(x-xg)+(y-yg)*(y-yg);
      mini:=0;
      for i:=1 to Count-1 do begin
        xg:=Data[i].x;
        yg:=Data[i].y;
        mmin:=(x-xg)*(x-xg)+(y-yg)*(y-yg);
        if mmin<min then begin
          mini:=i;
          min:=mmin;
        end;
      end;
    end;
    Result:=mini;
  end;

  //Добавление, вычитание, умножение на указанное число
  procedure TGrafic.MulX(x:Extended);
  var i:integer;
  begin
    for i:=0 to count-1 do
      Data[i].x:=Data[i].x*x;
  end;
  procedure TGrafic.MulY(y:Extended);
  var i:integer;
  begin
    for i:=0 to count-1 do
      Data[i].y:=Data[i].y*y;
  end;
  procedure TGrafic.DivX(x:Extended);
  var i:integer;
  begin
    for i:=0 to count-1 do
      Data[i].x:=Data[i].x/x;
  end;
  procedure TGrafic.DivY(y:Extended);
  var i:integer;
  begin
    for i:=0 to count-1 do
      Data[i].y:=Data[i].y/y;
  end;
  procedure TGrafic.SubX(x:Extended);
  var i:integer;
  begin
    for i:=0 to count-1 do
      Data[i].x:=Data[i].x-x;
  end;
  procedure TGrafic.SubY(y:Extended);
  var i:integer;
  begin
    for i:=0 to count-1 do
      Data[i].y:=Data[i].y-y;
  end;
  procedure TGrafic.AddX(x:Extended);
  var i:integer;
  begin
    for i:=0 to count-1 do
      Data[i].x:=Data[i].x+x;
  end;
  procedure TGrafic.AddY(y:Extended);
  var i:integer;
  begin
    for i:=0 to count-1 do
      Data[i].y:=Data[i].y+y;
  end;
  //математические операции между графиками
  function TGrafic.MulG(Grafic:TGrafic):TGrafic;
  var i,j:Integer;
    mx:Extended;
    stv:string;
  begin
    Result:=TGrafic.create;
    mx:=GetMinX;
    for i:=0 to Grafic.Count-1 do
      if Grafic.Data[i].x>=mx then Break;
    mx:=GetMaxX;
    Result.NameX:=NameX;
    Result.NameY:=NameY;
    Result.GrafName:=GrafName+'_mul_'+Grafic.GrafName;
    Result.GrafColor:=Grafic.GrafColor or GrafColor;
    while (i<Grafic.Count)and(Grafic.Data[i].x<=GetMaxX) do begin
      //SetY(i,GetY(i)*Grafic.GetYForX(GetX(i)));
      inc(Result.count);
      SetLength(Result.Data, Result.count);
      Result.Data[count-1].x:=Grafic.Data[i].x;
      Result.Data[count-1].y:=Data[i].y*Grafic.Data[i].y;
      i:=i+1;
    end;
  end;
  function TGrafic.divG(Grafic:TGrafic):TGrafic;
  var i,j:Integer;
    mx:Extended;
    stv:string;
  begin
    Result:=TGrafic.create;
    mx:=GetMinX;
    for i:=0 to Grafic.Count-1 do
      if Grafic.GetX(i)>=mx then Break;
    mx:=GetMaxX;
    Result.NameX:=NameX;
    Result.NameY:=NameY;
    Result.GrafName:=GrafName+'_div_'+Grafic.GrafName;
    Result.GrafColor:=Grafic.GrafColor or GrafColor;
    while (i<Grafic.Count)and(Grafic.Data[i].x<=GetMaxX) do begin
      inc(Result.count);
      SetLength(Result.Data, Result.count);
      Result.Data[count-1].x:=Grafic.Data[i].x;
      Result.Data[count-1].y:=Data[i].y/Grafic.Data[i].y;
      i:=i+1;
    end;
  end;
  function TGrafic.SubG(Grafic:TGrafic):TGrafic;
  var i:Integer;
  begin
    Result:=TGrafic.create;
    Result.NameX:=NameX;
    Result.NameY:=NameY;
    Result.GrafName:=Grafic.GrafName+'_sub_'+GrafName;
    Result.GrafColor:=Grafic.GrafColor or GrafColor;
    Result.count:=Self.count;
    SetLength(Result.Data, Result.count);
    for i:=0 to Self.count-1 do begin
      Result.Data[i].x:=Self.data[i].x;
      Result.Data[i].y:=Self.data[i].y-Grafic.GetYForX(Self.data[i].x);
    end;
  end;
  function TGrafic.AddG(Grafic:TGrafic):TGrafic;
  var i:Integer;
  begin
    Result:=TGrafic.create;
    Result.NameX:=NameX;
    Result.NameY:=NameY;
    Result.GrafName:=Grafic.GrafName+'_sub_'+GrafName;
    Result.GrafColor:=Grafic.GrafColor or GrafColor;
    Result.count:=Self.count;
    SetLength(Result.Data, Result.count);
    for i:=0 to Self.count-1 do begin
      Result.Data[i].x:=Self.data[i].x;
      Result.Data[i].y:=Self.data[i].y+Grafic.GetYForX(Self.data[i].x);
    end;
  end;
  function TGrafic.CopyGraf:TGrafic;
  var i:Integer;
  begin
    Result:=TGrafic.create;
    Result.NameX:=NameX;
    Result.NameY:=NameY;
    Result.GrafName:='Copy of'+GrafName;
    Result.GrafColor:=GrafColor;
    Result.Selected:=Selected;
    Result.SelectedX1:=SelectedX1;
    Result.SelectedX2:=SelectedX2;
    Result.count:=count;
    SetLength(Result.Data, Result.count);
    for i:=0 to Count-1 do
      Result.Data[i]:=Data[i];
  end;
  function TGrafic.GetSelectedGraf:TGrafic;
  var i:Integer;
    t:Extended;
  begin
    Result:=TGrafic.create;
    Result.NameX:=NameX;
    Result.NameY:=NameY;
    Result.GrafName:='subgraph of '+GrafName;
    Result.GrafColor:=GrafColor;
    Result.Selected:=False;
    Result.SelectedX1:=0;
    Result.SelectedX2:=0;
    if SelectedX2<SelectedX1 then begin
      t:=SelectedX2;
      SelectedX2:=SelectedX1;
      SelectedX1:=t;
    end;
    for i:=0 to Count-1 do begin
      t:=GetX(i);
      if (SelectedX1<=t)and(SelectedX2>=t) then begin
        inc(Result.count);
        SetLength(Result.Data, Result.count);
        Result.Data[Result.count-1]:=Data[i];
      end;
    end;
  end;
  destructor TGrafic.destroy;
  begin
    count:=0;
    SetLength(Data,count);
    TData.Destroy;
  end;
  function TGrafic.SaveToFile(FileName:string):Boolean;
  var
    sf:TStringList;
    i:Integer;
    stv:string;
  begin
    sf:=TStringList.Create;
    sf.Add('VER=GRAFIC1.1');
    sf.Add('NameX='+ Self.NameX);
    sf.Add('NameY='+Self.NameY);
    sf.Add('GrafName='+Self.GrafName);
    sf.Add('GrafColor='+IntToStr(Self.GrafColor));
    sf.Add('Selected='+BoolToStr(Self.Selected));
    sf.Add('SelectedX1='+FloatToStr(Self.SelectedX1));
    sf.Add('SelectedX2='+FloatToStr(Self.SelectedX2));
    sf.Add('DATA');
    for i:=0 to count-1 do begin
      stv:=FloatToStr(Data[i].x)+#9+FloatToStr(Data[i].y);
      while Pos(',', stv)<>0 do stv[Pos(',', stv)]:='.';
      sf.Add(stv);
    end;
    sf.SaveToFile(FileName);
    sf.Destroy;
  end;
  function TGrafic.ExportToTXT(FileName:string):Boolean;
  var
    sf:TStringList;
    i:Integer;
    stv:string;
  begin
    sf:=TStringList.Create;
    for i:=0 to count-1 do begin
      stv:=FloatToStr(Data[i].x)+#9+FloatToStr(Data[i].y);
      while Pos(',', stv)<>0 do stv[Pos(',', stv)]:='.';
      sf.Add(stv);
    end;
    sf.SaveToFile(FileName);
    sf.Destroy;
  end;
  function TGrafic.GetYForX(x:extended):Extended;//Фукция возвращает значение Y для точки X
  var i,a,b:Integer;
  begin
    if Count>0 then begin
      if x<=Data[0].x then Result:=Data[0].y
      else if x>=Data[Count-1].x then Result:=Data[Count-1].y
      else begin
        a:=0;
        b:=Count-1;
        while b-a>1 do begin
          if x>=Data[(b+a) div 2].x then a:=(b+a) div 2;
          if x<Data[(b+a) div 2].x then b:=(b+a) div 2;
        end; {
        for i:=1 to data.Count-1 do begin
          if x<GetX(i) then Break;
        end;  }
        i:=(a+b+1) div 2;
        Result:=(Data[i].y-Data[i-1].y)/(Data[i].x-Data[i-1].x)*(x-Data[i-1].x)+Data[i-1].y;
      end;

    end;
  end;
end.

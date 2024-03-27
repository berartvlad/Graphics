unit Unit1;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, ExtCtrls, ComCtrls, Menus, config, ExtDlgs, Clipbrd,INIFILE, ShellAPI, Grafic,
  Grids, API, Sockets, FastGraf;

type
  TForm1 = class(TForm)
    Image1: TImage;
    TrackBar1: TTrackBar;
    Label1: TLabel;
    OpenDialog1: TOpenDialog;
    MainMenu1: TMainMenu;
    N1: TMenuItem;
    N2: TMenuItem;
    N4: TMenuItem;
    N5: TMenuItem;
    N6: TMenuItem;
    N7: TMenuItem;
    N8: TMenuItem;
    N9: TMenuItem;
    N12: TMenuItem;
    N14: TMenuItem;
    SaveDialog1: TSaveDialog;
    Label2: TLabel;
    Label3: TLabel;
    N3: TMenuItem;
    Panel1: TPanel;
    Label4: TLabel;
    TrackBar2: TTrackBar;
    Label5: TLabel;
    Button1: TButton;
    PopupMenu1: TPopupMenu;
    BMP1: TMenuItem;
    Matlab1: TMenuItem;
    Origin1: TMenuItem;
    Matlab2: TMenuItem;
    SavePictureDialog1: TSavePictureDialog;
    N15: TMenuItem;
    N18: TMenuItem;
    OpenDialog2: TOpenDialog;
    Panel2: TPanel;
    GroupBox1: TGroupBox;
    StringGrid1: TStringGrid;
    ComboBox1: TComboBox;
    BMP2: TMenuItem;
    N27: TMenuItem;
    BMP3: TMenuItem;
    PopupMenu3: TPopupMenu;
    N28: TMenuItem;
    N29: TMenuItem;
    N30: TMenuItem;
    N31: TMenuItem;
    N32: TMenuItem;
    N33: TMenuItem;
    N34: TMenuItem;
    N36: TMenuItem;
    N37: TMenuItem;
    N38: TMenuItem;
    N39: TMenuItem;
    N40: TMenuItem;
    Origin2: TMenuItem;
    N10: TMenuItem;
    N11: TMenuItem;
    N13: TMenuItem;
    N19: TMenuItem;
    ColorDialog1: TColorDialog;
    TcpServer1: TTcpServer;
    TcpClient1: TTcpClient;
    Timer1: TTimer;
    N20: TMenuItem;
    N21: TMenuItem;
    N22: TMenuItem;
    N16: TMenuItem;
    Timer2: TTimer;
    procedure FormCreate(Sender: TObject);
    procedure TrackBar1Change(Sender: TObject);
    procedure Image1MouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure Image1MouseUp(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure Image1MouseMove(Sender: TObject; Shift: TShiftState; X,
      Y: Integer);
    procedure N3Click(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure BMP1Click(Sender: TObject);
    procedure FormResize(Sender: TObject);
    procedure StringGrid1Exit(Sender: TObject);
    procedure ListBox1Exit(Sender: TObject);
    procedure N4Click(Sender: TObject);
    procedure N23Click(Sender: TObject);
    procedure N24Click(Sender: TObject);
    procedure Image1DblClick(Sender: TObject);
    procedure ComboBox1Change(Sender: TObject);
    procedure StringGrid1MouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure Panel2MouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure Matlab1Click(Sender: TObject);
    procedure Origin1Click(Sender: TObject);
    procedure Image1Click(Sender: TObject);
    procedure N5Click(Sender: TObject);
    procedure N2Click(Sender: TObject);
    procedure Matlab2Click(Sender: TObject);
    procedure BMP3Click(Sender: TObject);
    procedure N18Click(Sender: TObject);
    procedure N30Click(Sender: TObject);
    procedure N31Click(Sender: TObject);
    procedure N32Click(Sender: TObject);
    procedure N33Click(Sender: TObject);
    procedure N34Click(Sender: TObject);
    procedure N40Click(Sender: TObject);
    procedure N28Click(Sender: TObject);
    procedure N37Click(Sender: TObject);
    procedure N38Click(Sender: TObject);
    procedure N39Click(Sender: TObject);
    procedure BMP2Click(Sender: TObject);
    procedure N15Click(Sender: TObject);
    procedure Origin2Click(Sender: TObject);
    procedure N14Click(Sender: TObject);
    procedure N10Click(Sender: TObject);
    procedure N27Click(Sender: TObject);
    procedure mainmenu(Sender:TObject);
    procedure N19Click(Sender: TObject);
    procedure StringGrid1DblClick(Sender: TObject);
    procedure StringGrid1SelectCell(Sender: TObject; ACol, ARow: Integer;
      var CanSelect: Boolean);
    procedure TcpServer1Accept(Sender: TObject;
      ClientSocket: TCustomIpClient);
    procedure Timer1Timer(Sender: TObject);
    procedure N20Click(Sender: TObject);
    procedure N21Click(Sender: TObject);
    procedure StringGrid1SetEditText(Sender: TObject; ACol, ARow: Integer;
      const Value: String);
    procedure Timer2Timer(Sender: TObject);

  private
    { Private declarations }
  public
    { Public declarations }
  end;
procedure autoscale (gr:TGrafic);//Автоматическое масштабирование для указанного графика
procedure Setka;//Прорисовка координатной сетки
procedure RefreshGrafs;//Прорисовка графиков
procedure RefreshProperties;
var
  Form1: TForm1;
  Grafiki:array of TGrafic;//Массив графиков
  GrafCount:Integer;//Количество загруженных графов
  masshtab, masshtabX,masshtabY:Extended;//Общий масштаб и масштабы по осям
  ShiftX, ShiftY:Integer;//Смещения центра координат относительно центра экрана
  xm,ym:Integer;//кооординаты мыши
  CurrentDir:String;//Текущая папка
  MButton:TMouseButton;//Кнопки мыши
//  selecting:Boolean;//Флаг режима выделения части графика
//  CreatingGraf:Boolean;//Флаг поточечного создания/редактирования графика
  EPI:Integer;//Номер пары x-y, который переносят мышью
  MMove:Boolean;//Флаг для регистрации перемещения мыши при нажатии
//  Transforming:Boolean;//Флаг режима трансформации графика
  LastX, LastY:Extended;//Значение последнего х,y во время создания графика
  mode:Integer; //Режим работы с графиком (Выделение, трансформация, редактирование и прочее).
  fon:TColor; //Цвет фона
  ColorFixAxes:TColor;  //Цвет фиксированных осей
  ColorNofixAxes:TColor;  //Цвет не фиксированных осей
  N3_1: TMenuItem;
  Sources: array of TMenuItem;
  tools: array of TMenuItem;
  actions: array of TMenuItem;
  EditingProperty:Integer;
  sem:Integer;
implementation

uses Math, Unit2, Unit3, Types;
{$R *.dfm}
const
  norm=0;
  selecting=1;
  transforming=2;
  editing=3;
/////////////////////////////\
//API Разработка интерфейса
//Обработчик для меню
procedure TForm1.mainmenu(Sender:TObject);
var stv:string;
begin
//  ShowMessage((Sender as TMenuItem).Caption);
  TcpServer1.Active:=True;
  stv:='"'+CurrentDir+'\Компоненты\Источники\'+(Sender as TMenuItem).Caption+'.exe"';
  while pos('&', stv)<>0 do delete(stv,pos('&', stv),1);
  ShellExecute(0, PChar('open'), PChar(stv), PChar(TcpServer1.localport), nil, SW_RESTORE);
  ReciveCommands.Clear;
end;
procedure InitSources;
var
  mn:TStringList;
  i:Integer;
begin
  mn:=GetListExeFiles(CurrentDir+'\Компоненты\Источники');
  SetLength(Sources,mn.Count);
  for i:=0 to mn.Count-1 do begin
    Sources[i]:=TMenuItem.Create(Form1.N11);
    Sources[i].Caption:=Copy(mn[i],1,Length(mn[i])-4);
    Sources[i].OnClick:=Form1.mainmenu;
    Form1.MainMenu1.Items[0].Items[2].Add(Sources[i]);
//    Form1.MainMenu1.Items[0].Items[2].Items[i].OnClick:=
  end;
end;

//////////////////////////////
function XFunToXScreen(X:extended):Integer;//Перевод из координат функции в координаты дисплея
begin
  XFunToXScreen:=Round(Form1.Image1.Width/2+x*masshtab*masshtabX)+ShiftX;
end;
function YFunToYScreen(Y:extended):Integer;//Перевод из координат функции в координаты дисплея
begin
  YFunToYScreen:=Round(Form1.Image1.Height/2-y*masshtab*masshtabY)+ShiftY
end;
function XScreenToXFun(X:Integer):Extended;//Перевод координаты экрана на координаты сетки
begin
  if masshtabX*masshtab<>0 then
    XScreenToXFun:=(X-Form1.Image1.Width/2-ShiftX)/(masshtabX*masshtab);
end;
function YScreenToYFun(Y:Integer):Extended;//Перевод координаты экрана на координаты сетки
begin
  If masshtabY*masshtab<>0 then
    YScreenToYFun:=(Form1.Image1.Height/2-y+ShiftY)/(masshtabY*masshtab);
end;
procedure putpixel(x,y:extended;color:longint);//Прорисовка точки в указанных координатах сетки
begin
  //form1.Image1.Canvas.Pixels[XFunToXScreen(X),YFunToYScreen(Y)]:=color;
  fastPutPixel(XFunToXScreen(X),YFunToYScreen(Y), color);
end;
procedure FillCircle(x,y:extended; color:longint);//Прорисовка круга в указанных координатах сетки
begin
{  form1.Image1.Canvas.Brush.Color:=color;
  form1.Image1.Canvas.Pen.Color:=color;
  form1.Image1.Canvas.Ellipse(XFunToXScreen(X)-4,YFunToYScreen(Y)-4,XFunToXScreen(X)+4,YFunToYScreen(Y)+4);
  form1.Image1.Canvas.Brush.Color:=clBackground;
}
  FastFilledCircle(XFunToXScreen(X), YFunToYScreen(Y),4, color);
end;

procedure line(x1,y1,x2,y2:extended; color:longint);//Прорисовка линии в указанных координатах сетки
begin
{  Form1.Image1.Canvas.Pen.Color:=color;
  Form1.Image1.Canvas.MoveTo(XFunToXScreen(X1),YFunToYScreen(Y1));
  Form1.Image1.Canvas.LineTo(XFunToXScreen(X1),YFunToYScreen(Y1));
}
  FastLine(XFunToXScreen(X1),YFunToYScreen(Y1), XFunToXScreen(X2),YFunToYScreen(Y2), color);
end;
procedure lineTo(x2,y2:extended; color:longint);//Прорисовка линии от прошлых координат к указанным
begin
//  Form1.Image1.Canvas.Pen.Color:=color;
//  Form1.Image1.Canvas.LineTo(XFunToXScreen(X2),YFunToYScreen(Y2));
  FastLineTo(XFunToXScreen(X2),YFunToYScreen(Y2), color);

end;
procedure MoveTo(x1,y1:extended);//Перемещение ручки на указанные координаты сетки
begin
  //Form1.Image1.Canvas.MoveTo(XFunToXScreen(X1),YFunToYScreen(Y1));
  FastMoveTo(XFunToXScreen(X1),YFunToYScreen(Y1));
end;
procedure OutText(x,y:extended; text:string; color:longint);//Вывод текста на указанных координатах
begin
  bitm.Canvas.Font.Color:=color;
  bitm.Canvas.TextOut(XFunToXScreen(X),YFunToYScreen(Y),text);
end;
function G(A,z,w,x:extended):Extended;//Вычисление Гауссиана в точке х,
var l:Extended;
begin// где A - Амплитуда, w - полуширина, z - частотное положение максимума.
  //Result:=A*exp(-2.77*((x-z)/w)*((x-z)/w));
  l:=(x-660.81)/50;
  Result:=5533*exp(-l*l);
end;
function L(A,z,w,x:extended):Extended;//Вычисление Лоренциана в точке х,
begin// где A - Амплитуда, w - полуширина, z - частотное положение максимума.
  Result:=(A*w*w)/(w*w+(x-z)*(x-z));
end;
procedure autoscale (gr:TGrafic);//Автомасштабирование для указанного графика
var t:Extended;
begin
  t:=gr.GetMaxX-gr.GetMinX;
  if t<0.01 then t:=0.01;
  masshtabX:=Form1.Image1.Width/(t);

  t:=gr.GetMaxY-gr.GetMinY;
  if t<0.01 then t:=0.01;
  masshtabY:=Form1.Image1.Height/(t);
  masshtab:=0.8;

  ShiftX:=-round(((gr.GetMaxX+gr.GetMinX)/2)*Masshtab*MasshtabX);
  ShiftY:=+round(((gr.GetMaxY+gr.GetMinY)/2)*Masshtab*MasshtabY);
end;
//Процедура рисования координатной сетки.
procedure Setka;
var i,j:Integer;
  t:Extended;
begin
  bitm.Canvas.Brush.Color:=fon;
  bitm.Canvas.Rectangle(0,0,Form1.Image1.Width,Form1.Image1.Height);
  line(XScreenToXFun(0),0,XScreenToXFun(Form1.Image1.Width),0,ColorNofixAxes);
  line(0,YScreenToYFun(0),0,YScreenToYFun(Form1.Image1.Height),ColorNofixAxes);
  for i:=0 to 100 do begin
    line(XScreenToXFun(i*100),-10/(masshtab*masshtabY), XScreenToXFun(i*100),10/(masshtab*masshtabY), ColorNofixAxes);
    line(-10/(masshtab*masshtabX),YScreenToYFun(i*100),10/(masshtab*masshtabX),YScreenToYFun(i*100), ColorNofixAxes);
    OutText(XScreenToXFun(i*100),-10/(masshtab*masshtabY),FloatToStr(round(XScreenToXFun(i*100)*100)/100), ColorNofixAxes);
    OutText(-10/(masshtab*masshtabX),YScreenToYFun(i*100+10),FloatToStr(round(YScreenToYFun(i*100)*100)/100), ColorNofixAxes);
  end;
  bitm.Canvas.Font.Color:=ColorFixAxes;
  FastLine(40,0,40,Form1.Image1.Height,ColorFixAxes);
  FastLine(0,Form1.Image1.Height-40, Form1.Image1.Width, Form1.Image1.Height-40,ColorFixAxes);
  for i:=0 to Form1.Image1.Width div 100 do begin
    FastLine(i*100,Form1.Image1.Height-50,i*100, Form1.Image1.Height-30,ColorFixAxes);
    bitm.Canvas.TextOut(i*100, Form1.Image1.Height-30, FloatToStr(Round(XScreenToXFun(i*100)*100)/100));
  end;
  for i:=0 to Form1.Image1.Height div 100 do begin
    FastLine(30,i*100, 50,i*100,ColorFixAxes);
    bitm.Canvas.TextOut(50, i*100, FloatToStr(Round(YScreenToYFun(i*100)*100)/100));
  end;
  Form1.Image1.Picture.Bitmap.Canvas.Draw(0, 0, bitm);
end;
procedure ShowGraf(graf:TGrafic; w:Integer);//Проприсовка указанного графика
var
  b,e, i:integer;
  y:Integer;
  ib,ie:Integer;
  xb,xe,xt:Extended;
  cl:TColor;
begin
  b:=Max(0,XFunToXScreen(graf.GetMinX));
  e:=Min(Form1.Image1.Width, XFunToXScreen(graf.GetMaxX));
  //Form1.Image1.Canvas.Pen.Width:=w;
  cl:=graf.GrafColor;
  FastMoveTo(b, YFunToYScreen(graf.GetYForX(graf.GetMinX)));
  if graf.Selected then begin
    xb:=graf.SelectedX1;
    xe:=graf.SelectedX2;
    ib:=XFunToXScreen(xb);
    ie:=XFunToXScreen(xe);
    for i:=b+1 to e do begin
      if (i>=ib)and(i<=ie)or(i<=ib)and(i>=ie) then cl:=clAqua
      else cl:=graf.GrafColor;
      y:=YFunToYScreen(graf.GetYForX(XScreenToXFun(i)));
      if w>1 then FastLineToBold(i, y, cl)
      else FastLineTo(i, y, cl);
    end;
  end else begin
    for i:=b+1 to e do begin
      y:=YFunToYScreen(graf.GetYForX(XScreenToXFun(i)));
      if w>1 then FastLineToBold(i, y, cl)
      else FastLineTo(i, y, cl);
    end;

  end;
end;
procedure ShowCreatingGraf(graf:TGrafic); //Прорисовка создаваемого графика
var i:Integer;
  x,y:extended;
begin
//  form1.Image1.Canvas.Pen.Color:=clYellow;
//  form1.Image1.Canvas.Pen.Width:=1;
  for i:=1 to graf.Count-1 do begin
    x:=graf.GetX(i-1);
    y:=graf.GetY(i-1);
    MoveTo(x,y);
    x:=graf.GetX(i);
    y:=graf.GetY(i);
    lineTo(x,y,clYellow);
  end;
  for i:=0 to graf.Count-1 do
    FillCircle(graf.GetX(i),graf.GetY(i), clRed);
end;
procedure RefreshGrafs;//Прорисовка всех графиков
var i:Integer;
begin
  //bitm.Canvas.Draw(0, 0, Form1.Image1.Picture.Bitmap);
  for i:=0 to GrafCount-1 do
    if Form1.ComboBox1.ItemIndex=i then begin
      if mode=transforming then begin
        {//form1.Image1.Canvas.Pen.color:=$FFFF00;
        //form1.Image1.Canvas.MoveTo(XFunToXScreen(Grafiki[i].GetMinX), YFunToYScreen(Grafiki[i].GetMinY));
        //form1.Image1.Canvas.LineTo(XFunToXScreen(Grafiki[i].GetMaxX), YFunToYScreen(Grafiki[i].GetMinY));
        //form1.Image1.Canvas.LineTo(XFunToXScreen(Grafiki[i].GetMaxX), YFunToYScreen(Grafiki[i].GetMaxY));
        //form1.Image1.Canvas.LineTo(XFunToXScreen(Grafiki[i].GetMinX), YFunToYScreen(Grafiki[i].GetMaxY));
        form1.Image1.Canvas.LineTo(XFunToXScreen(Grafiki[i].GetMinX), YFunToYScreen(Grafiki[i].GetMinY));}
        FastLine(XFunToXScreen(Grafiki[i].GetMinX), YFunToYScreen(Grafiki[i].GetMinY), XFunToXScreen(Grafiki[i].GetMaxX), YFunToYScreen(Grafiki[i].GetMinY),$FFFF00);
        FastLine(XFunToXScreen(Grafiki[i].GetMaxX), YFunToYScreen(Grafiki[i].GetMinY), XFunToXScreen(Grafiki[i].GetMaxX), YFunToYScreen(Grafiki[i].GetMaxY), $FFFF00);
        FastLine(XFunToXScreen(Grafiki[i].GetMaxX), YFunToYScreen(Grafiki[i].GetMaxY), XFunToXScreen(Grafiki[i].GetMinX), YFunToYScreen(Grafiki[i].GetMaxY), $FFFF00);
        FastLine(XFunToXScreen(Grafiki[i].GetMinX), YFunToYScreen(Grafiki[i].GetMaxY), XFunToXScreen(Grafiki[i].GetMinX), YFunToYScreen(Grafiki[i].GetMinY), $FFFF00);
      end;
      if mode=editing then
        ShowCreatingGraf(Grafiki[i])
      else ShowGraf(Grafiki[i],3);
    end
    else ShowGraf(Grafiki[i],1);
  Form1.Image1.Canvas.Draw(0, 0, bitm);
end;
procedure RefreshProperties;
begin
  //Перезагрузка свойств графика
  if  Form1.ComboBox1.ItemIndex>=0 then begin
    Form1.StringGrid1.Cells[1,0]:=Grafiki[Form1.ComboBox1.ItemIndex].GrafName; //'Название';
    Form1.StringGrid1.Cells[1,1]:=Grafiki[Form1.ComboBox1.ItemIndex].NameX; //'X (Ед.Изм.)';
    Form1.StringGrid1.Cells[1,2]:=Grafiki[Form1.ComboBox1.ItemIndex].NameY; //'Y (Ед.Изм.)';
    Form1.StringGrid1.Cells[1,3]:=IntToStr(Grafiki[Form1.ComboBox1.ItemIndex].GrafColor); //'Цвет';
    Form1.StringGrid1.Cells[1,4]:=FloatToStr(Grafiki[Form1.ComboBox1.ItemIndex].GetMinX); //'Мин. X';
    Form1.StringGrid1.Cells[1,5]:=FloatToStr(Grafiki[Form1.ComboBox1.ItemIndex].GetMaxX); //'Макс. X';
    Form1.StringGrid1.Cells[1,6]:=FloatToStr(Grafiki[Form1.ComboBox1.ItemIndex].GetMinY); //'Мин. Y';
    Form1.StringGrid1.Cells[1,7]:=FloatToStr(Grafiki[Form1.ComboBox1.ItemIndex].GetMaxY); //'Макс. Y';
  end else begin
    Form1.StringGrid1.Cells[1,0]:=''; //'Название';
    Form1.StringGrid1.Cells[1,1]:=''; //'X (Ед.Изм.)';
    Form1.StringGrid1.Cells[1,2]:=''; //'Y (Ед.Изм.)';
    Form1.StringGrid1.Cells[1,3]:=''; //'Цвет';
    Form1.StringGrid1.Cells[1,4]:=''; //'Мин. X';
    Form1.StringGrid1.Cells[1,5]:=''; //'Макс. X';
    Form1.StringGrid1.Cells[1,6]:=''; //'Мин. Y';
    Form1.StringGrid1.Cells[1,7]:=''; //'Макс. Y';

  end;
end;


procedure TForm1.FormCreate(Sender: TObject);
var j:Integer;
begin

  mode:=0;//Обычный режим
//  selecting:=False;
  masshtab:=1;
  masshtabX:=1;
  masshtabY:=1;
  ShiftX:=0;
  ShiftY:=0;
  Randomize;
  GrafCount:=0;
  Form1.Caption:='';
{  if ParamCount>0 then begin
    GrafCount:=1;
    SetLength(Grafiki,GrafCount);
    Grafiki[0]:=TGrafic.create;
    Grafiki[0].LoadFromFile(ParamStr(1));
  end;}
  Setka;
  Form1.DoubleBuffered:=True;
  //bitm:=Image1.Picture.Bitmap;
  //Заполнения аблицы в панели
  StringGrid1.Cells[0,0]:='Название';
  StringGrid1.Cells[0,1]:='X (Ед.Изм.)';
  StringGrid1.Cells[0,2]:='Y (Ед.Изм.)';
  StringGrid1.Cells[0,3]:='Цвет';
  StringGrid1.Cells[0,4]:='Мин. X';
  StringGrid1.Cells[0,5]:='Макс. X';
  StringGrid1.Cells[0,6]:='Мин. Y';
  StringGrid1.Cells[0,7]:='Макс. Y';
  StringGrid1.Cells[0,8]:='X=';
  StringGrid1.Cells[0,9]:='Y=';
  EPI:=-1;
  if (ParamStr(1)<>'')and FileExists(ParamStr(1)) then begin
    Inc(GrafCount);
    SetLength(Grafiki,GrafCount);
    Grafiki[GrafCount-1]:=TGrafic.create;
    Grafiki[GrafCount-1].LoadFromFile(ParamStr(1));
    ComboBox1.Items.Add(Grafiki[GrafCount-1].GrafName);
    ComboBox1.Text:=Grafiki[GrafCount-1].GrafName;
    autoscale (Grafiki[GrafCount-1]);
    Setka;
    RefreshGrafs;

  end;
  InitSources;
end;


procedure TForm1.TrackBar1Change(Sender: TObject);//Масштабирование
var
  masshtab1:Extended;
begin
  masshtab1:=masshtab;
  masshtab:=((TrackBar1.Position)*(TrackBar1.Position)+1)/100;
//  ShiftY:=100;
  ShiftX:=round(ShiftX*masshtab/masshtab1);
  ShiftY:=round(ShiftY*masshtab/masshtab1);
  Setka;

  RefreshGrafs;
end;

procedure TForm1.Image1MouseDown(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
  var i:Integer;
begin
  MMove:=False;
  EPI:=-1;//Редактируемая точка графика
  MButton:=Button;
  Image1.PopupMenu:=PopupMenu1;
  case mode of
    norm: begin
      //stringgrid1.OnExit(Sender);
      if ComboBox1.ItemIndex>=0 then
      begin
        StringGrid1.Cells[1,8]:=FloatToStr(XScreenToXFun(X));
        StringGrid1.Cells[1,9]:=FloatToStr(Grafiki[ComboBox1.ItemIndex].GetYForX(XScreenToXFun(X)));
      end;
    end;
    selecting: begin
      if MButton=mbLeft then begin
        Grafiki[ComboBox1.ItemIndex].Selected:=True;
        Grafiki[ComboBox1.ItemIndex].SelectedX1:=XScreenToXFun(X);
      end;
    end;
    editing: begin
      EPI:=-1;
      if (form1.Image1.Canvas.Pixels[xm,ym]=CLRed) then begin
        if ComboBox1.ItemIndex>=0 then begin
          EPI:=Grafiki[ComboBox1.ItemIndex].GetIndexForXY(XScreenToXFun(xm),YScreenToYFun(ym));
          Image1.PopupMenu:=PopupMenu3;
        end;
      end;
    end;
    transforming:begin

    end;
  end;
end;

procedure TForm1.Image1MouseUp(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
var i:Integer;
  xt:Extended;
begin
  case mode of
    norm: begin
    end;
    selecting: begin
      Grafiki[ComboBox1.ItemIndex].Selected:=True;
      if Grafiki[ComboBox1.ItemIndex].SelectedX1>XScreenToXFun(X) then begin
        xt:=Grafiki[ComboBox1.ItemIndex].SelectedX1;
        Grafiki[ComboBox1.ItemIndex].SelectedX1:=XScreenToXFun(X);
        Grafiki[ComboBox1.ItemIndex].SelectedX2:=xt;
      end else Grafiki[ComboBox1.ItemIndex].SelectedX2:=XScreenToXFun(X);
      Grafiki[ComboBox1.ItemIndex].SelectedX2:=XScreenToXFun(X);
      if (Grafiki[ComboBox1.ItemIndex].SelectedX1=Grafiki[ComboBox1.ItemIndex].SelectedX2)
      then Grafiki[ComboBox1.ItemIndex].Selected:=False;
    end;
    editing: begin
      if (EPI>=0)and(MButton<>mbRight) then
      begin
        Grafiki[ComboBox1.ItemIndex].sort;
        EPI:=-1;
        Setka;
        RefreshGrafs;
      end;
    end;
    transforming:begin

    end;
  end;
  MButton:=mbMiddle;

end;

procedure TForm1.Image1MouseMove(Sender: TObject; Shift: TShiftState; X,
  Y: Integer);
  var i,x1,x2,y1,y2:Integer;
begin
//  Screen.Cursor :=- y div 20;
  MMove:=True;
  case mode of
    norm: begin
      if (MButton=mbLeft) then begin
        ShiftX:=ShiftX-(xm-x);
        ShiftY:=ShiftY+(y-ym);
        Setka;
        RefreshGrafs;
      end;
    end;
    selecting: begin
      if (MButton=mbLeft)and (ComboBox1.ItemIndex>=0) then begin//Если двигают нажатым во время выделения
        //ShiftX:=ShiftX-(xm-x);
        //ShiftY:=ShiftY+(y-ym);
        //Setka;
        Grafiki[ComboBox1.ItemIndex].SelectedX2:=XScreenToXFun(X);
        ShowGraf(Grafiki[ComboBox1.ItemIndex],3);
      end;
    end;
    editing: begin
      if MButton=mbLeft then begin
        if (EPI>=0)and(ComboBox1.ItemIndex>=0) then begin//Если двигают нажатым во время создания
          //Grafiki[ComboBox1.ItemIndex].Data[EPI]:=FloatToStr(XScreenToXFun(xm))+#9+FloatToStr(YScreenToYFun(ym));
          Grafiki[ComboBox1.ItemIndex].Data[EPI].x:=XScreenToXFun(xm);
          Grafiki[ComboBox1.ItemIndex].Data[EPI].y:=YScreenToYFun(ym);
        end else begin
          ShiftX:=ShiftX-(xm-x);
          ShiftY:=ShiftY+(y-ym);
        end;
        Setka;
        RefreshGrafs;
      end;
    end;
    transforming:begin
      x1:=XFunToXScreen(Grafiki[ComboBox1.ItemIndex].GetMinX);
      x2:=XFunToXScreen(Grafiki[ComboBox1.ItemIndex].GetMaxX);
      y1:=YFunToYScreen(Grafiki[ComboBox1.ItemIndex].GetMinY);
      y2:=YFunToYScreen(Grafiki[ComboBox1.ItemIndex].GetMaxY);
      if (xm>x1-3)and(ym>y2-3)and(xm<x2+3)and(ym<y1+3) then begin
        if (xm>x1+3)and(ym>y2+3)and(xm<x2-3)and(ym<y1-3) then begin
          Screen.Cursor :=  crSize;
          if (MButton=mbLeft) then begin
            Grafiki[ComboBox1.ItemIndex].AddX(XScreenToXFun(x)-XScreenToXFun(xm));
            Grafiki[ComboBox1.ItemIndex].AddY(YScreenToYFun(y)-YScreenToYFun(ym));
            RefreshProperties;
            Setka;
            RefreshGrafs;
          end;
        end else begin
          if (abs(xm-x1)<4) then begin
            Screen.Cursor := crSizeWE;
            if (MButton=mbLeft)and(Grafiki[ComboBox1.ItemIndex].GetMaxX<>XScreenToXFun(x)) then begin
              Grafiki[ComboBox1.ItemIndex].SetMinX(XScreenToXFun(x));
              RefreshProperties;
              Setka;
              RefreshGrafs;
            end;
          end;
          if (abs(xm-x2)<4) then begin
            Screen.Cursor := crSizeWE;
            if (MButton=mbLeft)and(Grafiki[ComboBox1.ItemIndex].GetMinX<>XScreenToXFun(x)) then begin
              Grafiki[ComboBox1.ItemIndex].SetMaxX(XScreenToXFun(x));
              RefreshProperties;
              Setka;
              RefreshGrafs;
            end;
          end;
          if (abs(ym-y1)<4) then begin
            Screen.Cursor := crSizeNS;
            if (MButton=mbLeft)and(Grafiki[ComboBox1.ItemIndex].GetMaxY<>YScreenToYFun(y)) then begin
              Grafiki[ComboBox1.ItemIndex].SetMinY(YScreenToYFun(y));
              RefreshProperties;
              Setka;
              RefreshGrafs;
            end;
          end;
          if (abs(ym-y2)<4) then begin
            Screen.Cursor := crSizeNS;
            if (MButton=mbLeft)and(Grafiki[ComboBox1.ItemIndex].GetMinY<>YScreenToYFun(y)) then begin
              Grafiki[ComboBox1.ItemIndex].SetMaxY(YScreenToYFun(y));
              RefreshProperties;
              Setka;
              RefreshGrafs;
            end;
          end;
//          Screen.Cursor :=crDrag;
        end;
      end else begin
        Screen.Cursor :=crDefault;
        if (MButton=mbLeft) then begin
          ShiftX:=ShiftX-(xm-x);
          ShiftY:=ShiftY+(y-ym);
          Setka;
          RefreshGrafs;
        end;

      end;

    end;
  end;
  xm:=x;
  YM:=y;
  Label2.Caption:='X = '+FloatToStr(XScreenToXFun(X));
  Label3.Caption:='Y = '+FloatToStr(YScreenToYFun(Y));
end;
procedure sgladit;//Убирает низкочастотную составляющую.
begin
end;
procedure TForm1.N3Click(Sender: TObject);
begin
  Panel1.Top:=form1.Height-200;
  Panel1.Left:=form1.Width-500;
  Panel1.Visible:=True;
end;

procedure TForm1.Button1Click(Sender: TObject);
begin
  Panel1.Visible:=False;
end;

procedure TForm1.BMP1Click(Sender: TObject);
begin
  if ComboBox1.ItemIndex>=0 then begin
    if mode<>selecting then begin
      mode:=selecting;
      PopupMenu1.Items[0].Caption:='Закончить выделение';
    end else begin
      mode:=norm;
      PopupMenu1.Items[0].Caption:='Выделение';
    end;
  end;
end;

procedure TForm1.FormResize(Sender: TObject);
begin
  Image1.Width:=Form1.Width-40;
  Image1.Height:=Form1.Height-140;
  Image1.Picture.Bitmap.Height:=Image1.Height;
  Image1.Picture.Bitmap.Width:=Image1.Width;
  Setka;
  RefreshGrafs;
  Label2.Top:=Form1.Height-150;
  Label3.Top:=Form1.Height-125;
  Panel1.Top:=form1.Height-200;
  Panel1.Left:=form1.Width-500;
  Panel2.Left:=form1.Width-200;
end;

procedure TForm1.StringGrid1Exit(Sender: TObject);
var II:Integer;
begin
  II:=ComboBox1.ItemIndex;
  if (II>=0)and(II<GrafCount) then Begin
    Grafiki[II].GrafName:=StringGrid1.Cells[1,0]; //'Название';
    ComboBox1.Items[II]:=StringGrid1.Cells[1,0];
    ComboBox1.Text:=StringGrid1.Cells[1,0];
    Grafiki[II].NameX:=StringGrid1.Cells[1,1]; //'X (Ед.Изм.)';
    Grafiki[II].NameY:=StringGrid1.Cells[1,2]; //'Y (Ед.Изм.)';
    Grafiki[II].GrafColor:=StrToInt(NormChislo(StringGrid1.Cells[1,3])); //'Цвет';
    if StringGrid1.Cells[1,4]<>FloatToStr(Grafiki[II].GetMinX) then  //'Мин. X';
      Grafiki[II].SetMinX(StrToFloat(NormChislo(StringGrid1.Cells[1,4])));
    if StringGrid1.Cells[1,5]<>FloatToStr(Grafiki[II].GetMaxX) then //'Макс. X';
      Grafiki[II].SetMaxX(StrToFloat(NormChislo(StringGrid1.Cells[1,5])));
    if StringGrid1.Cells[1,6]<>FloatToStr(Grafiki[II].GetMinY) then //'Мин. Y';
      Grafiki[II].SetMinY(StrToFloat(NormChislo(StringGrid1.Cells[1,6])));
    if StringGrid1.Cells[1,7]<>FloatToStr(Grafiki[II].GetMaxY) then //'Макс. Y';
      Grafiki[II].SetMaxY(StrToFloat(NormChislo(StringGrid1.Cells[1,7])));

    Setka;
    RefreshGrafs;

  end;
end;

procedure TForm1.ListBox1Exit(Sender: TObject);
var i:Integer;
begin
//  ListBox1.ItemIndex:=-1;
//  for i:=0 to ListBox1.Items.Count-1 do
//    ListBox1.Selected[i]:=False;

end;

procedure TForm1.N4Click(Sender: TObject);
begin
  if OpenDialog1.Execute then begin
    Inc(GrafCount);
    SetLength(Grafiki,GrafCount);
    Grafiki[GrafCount-1]:=TGrafic.create;
    Grafiki[GrafCount-1].LoadFromFile(OpenDialog1.FileName);
    ComboBox1.Items.Add(Grafiki[GrafCount-1].GrafName);
    ComboBox1.Text:=Grafiki[GrafCount-1].GrafName;
    autoscale (Grafiki[GrafCount-1]);
    Setka;
    RefreshGrafs;
  end;
end;

procedure TForm1.N23Click(Sender: TObject);
var j:Integer;
begin//Удаление выделенных графиков
  if ComboBox1.ItemIndex>=0 then
  begin
    Grafiki[ComboBox1.ItemIndex].destroy;
    for j:=ComboBox1.ItemIndex+1 to GrafCount-1 do
      Grafiki[j-1]:=Grafiki[j];
    GrafCount:=GrafCount-1;
    ComboBox1.Items.Delete(ComboBox1.ItemIndex);
  end;
end;

procedure TForm1.N24Click(Sender: TObject);
begin//Сохранение
  if ComboBox1.ItemIndex>=0 then
  begin
    SaveDialog1.FileName:=Grafiki[ComboBox1.ItemIndex].GrafName;
    If SaveDialog1.Execute then begin
      Grafiki[ComboBox1.ItemIndex].SaveToFile(SaveDialog1.FileName);
    end;
  end;
end;

procedure TForm1.Image1DblClick(Sender: TObject);
var i,j:Integer;
begin
    case mode of
    norm: begin
      for i:=0 to GrafCount-1 do
        if Abs(YFunToYScreen(Grafiki[i].GetYForX(XScreenToXFun(xm)))-ym)<5 then Break;
      if i<GrafCount then begin //Щелкнули на график
        ComboBox1.ItemIndex:=i;
        ComboBox1Change(Sender);
        if SelectedCombo=1 then begin
          form3.ComboBox1.ItemIndex:=i;
          SelectedCombo:=0;
          form3.ComboBox1Change(Sender);
        end;
        if SelectedCombo=2 then begin
          form3.ComboBox2.ItemIndex:=i;
          SelectedCombo:=0;
          form3.ComboBox2Change(Sender);
        end;
      end else begin
        ComboBox1.ItemIndex:=-1;
        ComboBox1.Text:='Выберите график из списка';
        ComboBox1Change(Sender);
        //RefreshProperties;
      end;
      RefreshProperties;
    end;
    selecting: begin
    end;
    editing: begin
      mode:=norm;
      i:=Grafiki[ComboBox1.ItemIndex].GetIndexForXY(LastX, LastY);
      if Grafiki[ComboBox1.ItemIndex].Count>i
      then Grafiki[ComboBox1.ItemIndex].Delete(i);
      RefreshProperties;
    end;
    transforming:begin
      mode:=norm;
    end;
  end;
  Setka;
  RefreshGrafs;
end;

procedure TForm1.ComboBox1Change(Sender: TObject);
begin
  if ComboBox1.ItemIndex>=0 then begin
    Form1.Caption:=IntToStr(ComboBox1.ItemIndex);
    RefreshProperties;
    if mode<>editing then autoscale(Grafiki[ComboBox1.ItemIndex]);
    Setka;
    RefreshGrafs;
  end;

end;

procedure TForm1.StringGrid1MouseDown(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin
  //stringgrid1.OnExit(Sender);

end;

procedure TForm1.Panel2MouseDown(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
begin
  stringgrid1.OnExit(Sender);

end;

procedure TForm1.Matlab1Click(Sender: TObject);
begin
  if ComboBox1.ItemIndex>=0 then begin
    inc(GrafCount);
    SetLength(Grafiki, GrafCount);
    if Grafiki[ComboBox1.ItemIndex].Selected then
      Grafiki[GrafCount-1]:=Grafiki[ComboBox1.ItemIndex].GetSelectedGraf
    else Grafiki[GrafCount-1]:=Grafiki[ComboBox1.ItemIndex].CopyGraf;
    ComboBox1.Items.Add(Grafiki[GrafCount-1].GrafName);
  end;
end;

procedure TForm1.Origin1Click(Sender: TObject);
var i:Integer;
begin
  if ComboBox1.ItemIndex>=0 then begin
    Grafiki[ComboBox1.ItemIndex].destroy;
    for i:=ComboBox1.ItemIndex to GrafCount-2 do begin
      Grafiki[i]:=Grafiki[i+1];
      ComboBox1.Items[i]:=ComboBox1.Items[i+1];
    end;
    ComboBox1.Items.Delete(ComboBox1.Items.Count-1);
    dec(GrafCount);
    SetLength(Grafiki, GrafCount);
    if GrafCount=0 then ComboBox1.Text:='Пусто'
    else ComboBox1.Text:='Выберите график из списка';
    Setka;
    RefreshGrafs;
  end;
end;

procedure TForm1.Image1Click(Sender: TObject);
var stv:string;
  i:Integer;
  vxy:TXY;
begin
  sem:=0;
  TrackBar1.SetFocus;
  case mode of
    norm: begin
    end;
    selecting: begin
    end;
    editing: begin
      if (form1.Image1.Canvas.Pixels[xm,ym]<>CLRed)and(not MMove) then begin
        LastX:=XScreenToXFun(xm);
        LastY:=YScreenToYFun(ym);
        vxy.x:=LastX;
        vxy.y:=LastY;
        i:=ComboBox1.ItemIndex;
        Grafiki[i].AddPoint(vxy);
        if (Grafiki[i].Count>2)and(Grafiki[i].GetX(Grafiki[i].Count-2)>LastX)
        then Grafiki[i].sort;
        ShowCreatingGraf(Grafiki[i]);
        Form1.Image1.Canvas.Draw(0, 0, bitm);
      end;
    end;
    transforming:begin
    end;
  end;
end;

procedure TForm1.N5Click(Sender: TObject);
var i:Integer;
begin
  for i:=0 to GrafCount-1 do begin
    SaveDialog1.FileName:=Grafiki[i].GrafName;
    If SaveDialog1.Execute then begin
      Grafiki[i].SaveToFile(SaveDialog1.FileName);
    end;
  end;
end;

procedure TForm1.N2Click(Sender: TObject);
begin
  //Добавление чистого графика
  mode:=editing;
  inc(GrafCount);
  SetLength(Grafiki, GrafCount);
  Grafiki[GrafCount-1]:=TGrafic.create;
  //Задание начальных значений
  Grafiki[GrafCount-1].GrafName:='NewGraf';
  Grafiki[GrafCount-1].GrafColor:=clYellow;
  //Выбор создаваемого графика
  ComboBox1.Items.Add('NewGraf');
  ComboBox1.ItemIndex:=GrafCount-1;
  ComboBox1Change(Sender);
end;

procedure TForm1.Matlab2Click(Sender: TObject);
begin//Редактирование графика
  If ComboBox1.ItemIndex>=0 then begin
    mode:=editing;
    Setka;
    RefreshGrafs;
  end;
end;

procedure TForm1.BMP3Click(Sender: TObject);
begin
  if SavePictureDialog1.Execute then
    Image1.Picture.SaveToFile(SavePictureDialog1.FileName);
end;

procedure TForm1.N18Click(Sender: TObject);
begin
  Clipboard.Assign(Image1.Picture);

end;

procedure TForm1.N30Click(Sender: TObject);
begin
  Form2.Label1.Caption:='Умножение графика на число';
   Form2.Label2.Caption:='Введите число, на которое нужно умножить график "'+Grafiki[ComboBox1.ItemIndex].GrafName+'"';
  form2.Visible:=True;
end;

procedure TForm1.N31Click(Sender: TObject);
begin
  Form2.Label1.Caption:='Деление графика на число';
  Form2.Label2.Caption:='Введите число, на которое нужно разделить график "'+Grafiki[ComboBox1.ItemIndex].GrafName+'"';
  form2.Visible:=True;
end;

procedure TForm1.N32Click(Sender: TObject);
begin
  Form2.Label1.Caption:='Прибавление числа к графику';
  Form2.Label2.Caption:='Введите число, которое нужно прибавить к графику "'+Grafiki[ComboBox1.ItemIndex].GrafName+'"';
  form2.Visible:=True;
end;

procedure TForm1.N33Click(Sender: TObject);
begin
  Form2.Label1.Caption:='Вычитание числа от графика';
  Form2.Label2.Caption:='Введите число, которое нужно отнять от графика "'+Grafiki[ComboBox1.ItemIndex].GrafName+'"';
  form2.Visible:=True;
end;

procedure TForm1.N34Click(Sender: TObject);
begin
  if ComboBox1.ItemIndex>=0 then begin
    Grafiki[ComboBox1.ItemIndex].SubY(Grafiki[ComboBox1.ItemIndex].GetMinY);
    //Перезагрузка свойств графика
    RefreshProperties;
    //Перерисовка графика
    autoscale (Grafiki[Form1.ComboBox1.ItemIndex]);
    Setka;
    RefreshGrafs;
  end;
end;

procedure TForm1.N40Click(Sender: TObject);
begin
  if ComboBox1.ItemIndex>=0 then
  begin
    SaveDialog1.FileName:=Grafiki[ComboBox1.ItemIndex].GrafName;
    If SaveDialog1.Execute then begin
      Grafiki[ComboBox1.ItemIndex].ExportToTXT(SaveDialog1.FileName);
    end;
  end;
end;

procedure TForm1.N28Click(Sender: TObject);
var i:Integer;
begin
  i:=EPI;
  Grafiki[ComboBox1.ItemIndex].Delete(i);
  EPI:=-1;
  Setka;
  RefreshGrafs;
end;

procedure TForm1.N37Click(Sender: TObject);
begin
  form3.ComboBox1.Items.Clear;
  form3.ComboBox2.Items.Clear;
  form3.ComboBox1.Items.AddStrings(form1.ComboBox1.Items);
  form3.ComboBox2.Items.AddStrings(form1.ComboBox1.Items);
  form3.ComboBox3.ItemIndex:=0;
  form3.ComboBox3.Text:=form3.ComboBox3.Items[form3.ComboBox3.ItemIndex];
  form3.ComboBox3.OnChange(Sender);
  form3.visible:=True;
end;

procedure TForm1.N38Click(Sender: TObject);
begin
  form3.ComboBox1.Items.Clear;
  form3.ComboBox2.Items.Clear;
  form3.ComboBox1.Items.AddStrings(form1.ComboBox1.Items);
  form3.ComboBox2.Items.AddStrings(form1.ComboBox1.Items);
  form3.ComboBox3.ItemIndex:=1;
  form3.ComboBox3.Text:=form3.ComboBox3.Items[form3.ComboBox3.ItemIndex];
  form3.ComboBox3.OnChange(Sender);
  form3.visible:=True;
end;

procedure TForm1.N39Click(Sender: TObject);
begin
  form3.ComboBox1.Items.Clear;
  form3.ComboBox2.Items.Clear;
  form3.ComboBox1.Items.AddStrings(form1.ComboBox1.Items);
  form3.ComboBox2.Items.AddStrings(form1.ComboBox1.Items);
  form3.ComboBox3.ItemIndex:=2;
  form3.ComboBox3.Text:=form3.ComboBox3.Items[form3.ComboBox3.ItemIndex];
  form3.ComboBox3.OnChange(Sender);
  form3.visible:=True;
end;

procedure TForm1.BMP2Click(Sender: TObject);
begin
  if ComboBox1.ItemIndex>=0 then
  mode:=transforming;
  RefreshGrafs;
end;

procedure TForm1.N15Click(Sender: TObject);
var mfile:TStringList;
  i,j:integer;
  stv:string;
  pmatlab:string;
begin
  //Передача в матлаб
  mfile:=TStringList.Create;
  if ComboBox1.ItemIndex>=0 then begin
    mfile.Add('% График '+Grafiki[ComboBox1.ItemIndex].GrafName);
    //Формирование массива Х
    stv:=Grafiki[ComboBox1.ItemIndex].NameX+'=[';
    for i:=0 to Grafiki[ComboBox1.ItemIndex].count-1 do begin
      stv:=stv+FloatToStr(Grafiki[ComboBox1.ItemIndex].GetX(i))+' ';
    end;
    while Pos(',', stv)<>0 do stv[Pos(',', stv)]:='.';
    stv:=stv+'];';
    mfile.Add(stv);
    //Формирование массива Y
    stv:=Grafiki[ComboBox1.ItemIndex].NameY+'=[';
    mfile.Add(stv);
    for i:=0 to Grafiki[ComboBox1.ItemIndex].count-1 do begin
      stv:=stv+FloatToStr(Grafiki[ComboBox1.ItemIndex].GetY(i))+' ';
    end;
    while Pos(',', stv)<>0 do stv[Pos(',', stv)]:='.';
    stv:=stv+'];';
    mfile.Add(stv);
    mfile.Add('plot('+Grafiki[ComboBox1.ItemIndex].NameX+', '+Grafiki[ComboBox1.ItemIndex].NameY+');');
  end else begin
    mfile.Add('hold on');
    for j:=0 to GrafCount-1 do begin
      mfile.Add('% График '+Grafiki[j].GrafName);
      //Формирование массива Х
      stv:=Grafiki[j].GrafName+'_'+Grafiki[j].NameX+'=[';
      for i:=0 to Grafiki[j].count-1 do begin
        stv:=stv+FloatToStr(Grafiki[j].GetX(i))+' ';
      end;
      while Pos(',', stv)<>0 do stv[Pos(',', stv)]:='.';
      stv:=stv+'];';
      mfile.Add(stv);
      //Формирование массива Y
      stv:=Grafiki[j].GrafName+'_'+Grafiki[j].NameY+'=[';
      for i:=0 to Grafiki[j].count-1 do begin
        stv:=stv+FloatToStr(Grafiki[j].GetY(i))+' ';
      end;
      while Pos(',', stv)<>0 do stv[Pos(',', stv)]:='.';
      stv:=stv+'];';
      mfile.Add(stv);
      mfile.Add('plot('+Grafiki[j].GrafName+'_'+Grafiki[j].NameX+', '+Grafiki[j].GrafName+'_'+Grafiki[j].NameY+');');
    end;
    mfile.Add('hold off');
  end;
  //Сохранение Matlab-файла
  mfile.SaveToFile(CurrentDir+'\'+'temp.m');
  //Запуск Matlab-файла
  ShellExecute(0, PChar('open'), PChar('"'+CurrentDir+'\'+'temp.m"'), nil, nil, SW_RESTORE);
//  pmatlab:=GetValue(CurrentDir+'\config', 'matlab');
//  if FileExists(pmatlab) then begin
//  end else ShowMessage('Не знаю, где Matlab'+#13+'config.ini->MATLAB');
end;

procedure TForm1.Origin2Click(Sender: TObject);
begin
  //Экспорт в Origin...
end;

procedure TForm1.N14Click(Sender: TObject);
begin
  ShowMessage('Данная еще функция не реализована');
end;

procedure TForm1.N10Click(Sender: TObject);
begin
  ShowMessage('Программа для визуальной обработки графиков'+#13+'VER=GRAFIC1.2 berartvlad@mail.ru 16.12.2023');
end;

procedure TForm1.N27Click(Sender: TObject);
begin
  close;
end;

procedure TForm1.N19Click(Sender: TObject);
begin
  If ColorDialog1.Execute then
    fon:=ColorDialog1.Color;
  Setka;
  RefreshGrafs;
  SetValue(CurrentDir+'\config', 'BackGraundColor', IntToStr(fon));
end;

procedure TForm1.StringGrid1DblClick(Sender: TObject);
begin
  if EditingProperty=3 then
    if ColorDialog1.Execute then
      StringGrid1.Cells[1,3]:=IntToStr(ColorDialog1.Color);
end;

procedure TForm1.StringGrid1SelectCell(Sender: TObject; ACol,
  ARow: Integer; var CanSelect: Boolean);
begin
  EditingProperty:=ARow;
//  Label2.Caption:='dfdsf';

end;

procedure TForm1.TcpServer1Accept(Sender: TObject;
  ClientSocket: TCustomIpClient);
var
  stv:string;
begin
  while sem<>0 do Sleep(10);
  sem:=1;
  stv:=ClientSocket.Receiveln;
  ReciveCommands.Text:=ReciveCommands.Text+stv;
  sem:=0;
end;

procedure TForm1.Timer1Timer(Sender: TObject);
var i, ti:Integer;
  stv:string;
  point:TXY;
begin
  TcpServer1.Active:=False;
  Timer1.Enabled:=False;
  for i:=0 to ReciveCommands.Count-1 do begin
    stv:=ReciveCommands[i];
    if (length(stv)>6)and(pos('NameX', stv)<>0) then begin
      Delete(stv,1,6);
      Grafiki[GrafCount-1].NameX:=stv;
      stv:='';
    end;
    if (length(stv)>6)and(pos('NameY', stv)<>0) then begin
      Delete(stv,1,6);
      Grafiki[GrafCount-1].NameY:=stv;
      stv:='';
    end;
    if (length(stv)>10)and(pos('GrafColor', stv)<>0) then begin
      Delete(stv,1,10);
      Grafiki[GrafCount-1].GrafColor:=StrToInt(stv);
      stv:='';
    end;
    if stv<>'' then begin
      Grafiki[GrafCount-1].TData.Add(stv);
      stv:=stv+#9+#9;
      ti:=Grafiki[GrafCount-1].TData.Count-1;
      Point.X:=StrToFloat(NormChislo(Copy(stv,1,Pos(#9,stv)-1)));
      System.Delete(stv,1,Pos(#9,stv));
      Point.Y:=StrToFloat(NormChislo(stv));
      Grafiki[GrafCount-1].AddPoint(point);
      stv:='';
    end;
  end;
  RefreshGrafs;
end;

procedure TForm1.N20Click(Sender: TObject);
begin
  If ColorDialog1.Execute then
    ColorFixAxes:=ColorDialog1.Color;
  Setka;
  RefreshGrafs;
  SetValue(CurrentDir+'\config', 'ColorFixAxes', IntToStr(ColorFixAxes));

end;

procedure TForm1.N21Click(Sender: TObject);
begin
  If ColorDialog1.Execute then
    ColorNofixAxes:=ColorDialog1.Color;
  SetValue(CurrentDir+'\config', 'ColorNofixAxes', IntToStr(ColorNofixAxes));
  Setka;
  RefreshGrafs;
end;
var stv:string;
procedure TForm1.StringGrid1SetEditText(Sender: TObject; ACol,
  ARow: Integer; const Value: String);
var II:Integer;
  stv:string;
begin
  stv:=NormChislo(StringGrid1.Cells[1,8]);
  if ARow=8 then begin
    II:=ComboBox1.ItemIndex;
    if (II>=0)and(II<GrafCount) then Begin
      StringGrid1.Cells[1,9]:=FloatToStr(Grafiki[II].GetYForX(StrToFloat(stv)));
    end;
  end;
end;

procedure TForm1.Timer2Timer(Sender: TObject);
var stv:string;
  GN, X,Y:string;
  vxy:TXY;
  GrI, i,j:Integer;
  GrName:string;
begin
  if sem <> 0 then Exit;
  sem:=2;
  GN:='';
  while ReciveCommands.Count> NCommand+1 do begin // Если пришла новая команда
    inc (NCommand);
    stv:=ReciveCommands[NCommand];
    //Если создаем новый график
    if pos('NewGraph', stv)<>0 then begin //Создаем новый график
//      mode:=editing;
      inc(GrafCount);
      SetLength(Grafiki, GrafCount);
      Grafiki[GrafCount-1]:=TGrafic.create;
      //Задание начальных значений
      Delete(stv,1,9);
      Grafiki[GrafCount-1].GrafName:=stv;
      Grafiki[GrafCount-1].GrafColor:=100;
      //Выбор создаваемого графика
      ComboBox1.Items.Add(stv);
      ComboBox1.ItemIndex:=GrafCount-1;
      ComboBox1Change(Sender);
    end;
    //добавление точки  в график
    if pos('AddPoint', stv)<>0 then begin //добавление точки в график
      stv:=stv+#9+#9+#9;
      delete(stv, 1, pos(#9,stv));
      GN:=copy(stv, 1, pos(#9,stv)-1);
      delete(stv, 1, pos(#9,stv));
      X:=copy(stv, 1, pos(#9,stv)-1);
      delete(stv, 1, pos(#9,stv));
      Y:=copy(stv, 1, pos(#9,stv)-1);
      i:=ComboBox1.Items.IndexOf(GN);
      if i>=0 then begin
        vxy.x:=StrToFloat(NormChislo(X));
        vxy.y:=StrToFloat(NormChislo(Y));
        Grafiki[i].AddPoint(vxy);
      end;
    end;
    //Загрузка графика из файла
    if pos('loadFile', stv)<>0 then begin
      Inc(GrafCount);
      SetLength(Grafiki,GrafCount);
      Grafiki[GrafCount-1]:=TGrafic.create;
      Delete(stv,1,9);
      Grafiki[GrafCount-1].LoadFromFile(stv);
      ComboBox1.Items.Add(Grafiki[GrafCount-1].GrafName);
      ComboBox1.Text:=Grafiki[GrafCount-1].GrafName;
      autoscale (Grafiki[GrafCount-1]);
      Setka;
      RefreshGrafs;
    end;
    //////////Выбираем последний измененный график
    if GN<>'' then begin
      ComboBox1.ItemIndex:=ComboBox1.Items.IndexOf(GN);
      ComboBox1Change(Sender);
    end;
    //////////

  end;
  //ComboBox1Change(Sender);
  sem:=0;
end;

initialization
  CurrentDir:=ParamStr(0);
  while CurrentDir[length(CurrentDir)]<>'\' do Delete(CurrentDir, length(CurrentDir), 1);
  Delete(CurrentDir, length(CurrentDir), 1);
  MButton:=mbMiddle;
  ColorFixAxes:=clBtnFace;
  ColorNofixAxes:=clRed;
  fon:=clBlack;
  stv:=GetValue(CurrentDir+'\config', 'ColorNofixAxes');
  if stv<>'' then
    ColorNofixAxes:=StrToInt(stv)
  else
    ColorNofixAxes:=clBlue;
  stv:=GetValue(CurrentDir+'\config', 'ColorFixAxes');
  if stv<>'' then
    ColorFixAxes:=StrToInt(stv)
  else
    ColorFixAxes:=clBlack;
  stv:=GetValue(CurrentDir+'\config', 'BackGraundColor');
  if stv<>'' then
    fon:=StrToInt(stv)
  else
    fon:=clWhite;
end.

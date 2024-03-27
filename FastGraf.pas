unit FastGraf;

interface
uses Windows, Graphics, Math;
type
  TRGBArray = array[0..42767] of TRGBTriple;
  PRGBArray = ^TRGBArray;
var
  bitm:TBitmap;
  prgb : array [0..1080] of PRGBArray;
  tox,toy:Integer;
procedure fastPutPixel(x,y:Integer; color:TColor);
function TColorToTRGBTriple(const InColor:TColor):TRGBTriple;
procedure FastFilledCircle(xc, yc, r: Integer; Color: TColor);
procedure FastLine(x1,y1,x2,y2:integer; color:TColor);
procedure FastLineBold(x1,y1,x2,y2:integer; color:TColor);
procedure FastMoveTo(x,y:Integer);
procedure FastLineTo(x,y:Integer; color:TColor);
procedure FastLineToBold(x,y:Integer; color:TColor);
implementation
function TColorToTRGBTriple(const InColor:TColor):TRGBTriple;
var
  r, g, b: byte;
begin
asm
   mov edx, InColor
    mov r, dl
    shr edx, 8
    mov g, dl
    shr edx, 8
    mov b, dl
  end;
  result.rgbtRed:=r;
  result.rgbtBlue:=b;
  result.rgbtGreen:=g;
end;
procedure fastPutPixel(x,y:Integer; color:TColor);
begin
  if (y>=0)and(y<1080)and(x>=0)and(x<1920) then
    prgb[y]^[x] :=TColorToTRGBTriple(Color);

end;
procedure FastFilledCircle(xc, yc, r: Integer; Color: TColor);
var
  dx,dy:Integer;
  i, j:Integer;
begin
  for i:=xc-r to xc+r do begin
    dx:=xc-i;
    for j:=yc-r to yc+r do begin
      dy:=yc-j;
      if (dx*dx)+(dy*dy)<r*r then
        fastPutPixel(i,j,Color);
    end;
  end;
end;
procedure FastLine(x1,y1,x2,y2:integer; color:TColor);
var
  //10,100,200,10,
  dx, dy, i: Integer;
  TRColor:TRGBTriple;
begin
  TRColor:=TColorToTRGBTriple(color);
  dx:=x2-x1;
  dy:=y2-y1;
  if Abs(dx)>abs(dy) then begin
    if x1>x2 then begin
      i:=x1;
      x1:=x2;
      x2:=i;
      i:=y1;
      y1:=y2;
      y2:=i;
      dx:=-dx;
      dy:=-dy;

    end;
    if x1<x2 then
      for i:=x1 to x2 do
        fastPutPixel(i, y1+round((i-x1)/dx*dy), color);

  end else begin
    if y1>y2 then begin
      i:=x1;
      x1:=x2;
      x2:=i;
      i:=y1;
      y1:=y2;
      y2:=i;
      dx:=-dx;
      dy:=-dy;
    end;
    if y1<y2 then
      for i:=y1 to y2 do
        fastPutPixel(x1+round((i-y1)/dy*dx),i, color);

  end;
end;
procedure FastLineBold(x1,y1,x2,y2:integer; color:TColor);
var
  //10,100,200,10,
  dx, dy, i: Integer;
  TRColor:TRGBTriple;
begin
  TRColor:=TColorToTRGBTriple(color);
  dx:=x2-x1;
  dy:=y2-y1;
  if Abs(dx)>abs(dy) then begin
    if x1>x2 then begin
      i:=x1;
      x1:=x2;
      x2:=i;
      i:=y1;
      y1:=y2;
      y2:=i;
      dx:=-dx;
      dy:=-dy;

    end;
    if x1<x2 then
      for i:=x1 to x2 do begin
        fastPutPixel(i, y1+round((i-x1)/dx*dy)-1, color);
        fastPutPixel(i, y1+round((i-x1)/dx*dy), color);
        fastPutPixel(i, y1+round((i-x1)/dx*dy)+1, color);
      end;

  end else begin
    if y1>y2 then begin
      i:=x1;
      x1:=x2;
      x2:=i;
      i:=y1;
      y1:=y2;
      y2:=i;
      dx:=-dx;
      dy:=-dy;
    end;
    if y1<y2 then
      for i:=y1 to y2 do begin
        fastPutPixel(x1+round((i-y1)/dy*dx)-1,i, color);
        fastPutPixel(x1+round((i-y1)/dy*dx),i, color);
        fastPutPixel(x1+round((i-y1)/dy*dx)+1,i, color);
      end;

  end;
end;
procedure FastMoveTo(x,y:Integer);
begin
  tox:=x;
  toy:=y;
end;
procedure FastLineTo(x,y:Integer; color:TColor);
begin
  FastLine(tox,toy,x,y,color);
  tox:=x;
  toy:=y;
end;
procedure FastLineToBold(x,y:Integer; color:TColor);
begin
  FastLineBold(tox,toy,x,y,color);
  tox:=x;
  toy:=y;
end;
var j:Integer;
initialization
begin
  bitm:=TBitmap.Create;
  bitm.LoadFromFile('12.bmp');
  //bitm.Height:=1080;
  //bitm.Width:=1920;
  for j:=0 to bitm.Height-1 do
    prgb[j] := bitm.ScanLine[j];


end;

end.

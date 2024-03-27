unit Unit2;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, Unit1, Grafic;

type
  TForm2 = class(TForm)
    Edit1: TEdit;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    procedure BitBtn1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form2: TForm2;

implementation

{$R *.dfm}

procedure TForm2.BitBtn1Click(Sender: TObject);
var
  vz:Extended;
begin
  //���������� ���������� �������� ��� ��������
  vz:=StrToFloat(NormChislo(Edit1.Text));
  if Label1.Caption='��������� ������� �� �����' then
    Grafiki[Form1.ComboBox1.ItemIndex].MulY(vz);
  if Label1.Caption='������� ������� �� �����' then
    if vz<>0 then Grafiki[Form1.ComboBox1.ItemIndex].DivY(vz)
    else ShowMessage('�� ���� ��������� �� ����');
  if Label1.Caption='����������� ����� � �������' then
    Grafiki[Form1.ComboBox1.ItemIndex].AddY(vz);
  if Label1.Caption='��������� ����� �� �������' then
    Grafiki[Form1.ComboBox1.ItemIndex].SubY(vz);
  //������������ ������� �������
  RefreshProperties;
  //����������� �������
  autoscale (Grafiki[Form1.ComboBox1.ItemIndex]);
  Setka;
  RefreshGrafs;
  Form2.Close;
end;

end.

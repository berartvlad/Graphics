unit Unit3;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons, Unit1;

type
  TForm3 = class(TForm)
    ComboBox1: TComboBox;
    ComboBox2: TComboBox;
    Label1: TLabel;
    ComboBox3: TComboBox;
    Edit1: TEdit;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    CheckBox1: TCheckBox;
    procedure ComboBox1Enter(Sender: TObject);
    procedure ComboBox2Enter(Sender: TObject);
    procedure ComboBox1Change(Sender: TObject);
    procedure ComboBox2Change(Sender: TObject);
    procedure ComboBox3Change(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form3: TForm3;
  SelectedCombo:Integer;
implementation

{$R *.dfm}

procedure TForm3.ComboBox1Enter(Sender: TObject);
begin
  SelectedCombo:=1;
end;

procedure TForm3.ComboBox2Enter(Sender: TObject);
begin
  SelectedCombo:=2;
end;

procedure TForm3.ComboBox1Change(Sender: TObject);
begin
  case ComboBox3.ItemIndex of
  0: Edit1.Text:='Сумма '+ComboBox1.Text+' и '+ComboBox2.Text;
  1: Edit1.Text:='Разность '+ComboBox1.Text+' и '+ComboBox2.Text;
  2: Edit1.Text:='Нормированный '+ComboBox2.Text+' к '+ComboBox1.Text;
  end;
end;

procedure TForm3.ComboBox2Change(Sender: TObject);
begin
  case ComboBox3.ItemIndex of
  0: Edit1.Text:='Сумма '+ComboBox1.Text+' и '+ComboBox2.Text;
  1: Edit1.Text:='Разность '+ComboBox1.Text+' и '+ComboBox2.Text;
  2: Edit1.Text:='Нормированный '+ComboBox2.Text+' к '+ComboBox1.Text;
  end;

end;

procedure TForm3.ComboBox3Change(Sender: TObject);
begin
  case ComboBox3.ItemIndex of
    0: Edit1.Text:='Сумма '+ComboBox1.Text+' и '+ComboBox2.Text;
    1: Edit1.Text:='Разность '+ComboBox1.Text+' и '+ComboBox2.Text;
    2: Edit1.Text:='Нормированный '+ComboBox2.Text+' к '+ComboBox1.Text;
  end;
  CheckBox1.Visible:=ComboBox3.ItemIndex=2;
end;

procedure TForm3.BitBtn1Click(Sender: TObject);
begin
  if (ComboBox1.ItemIndex<0)or(ComboBox2.ItemIndex<0)  then begin
    ShowMessage('Выберите графики, операцию над которыми надо произвести');
  end else begin
    case ComboBox3.ItemIndex of
    0:begin
        Inc(GrafCount);
        SetLength(Grafiki, GrafCount);
        Grafiki[GrafCount-1]:=Grafiki[Combobox1.itemindex].AddG(Grafiki[Combobox2.itemindex]);
        Grafiki[GrafCount-1].GrafName:=Edit1.Text;
        Form1.ComboBox1.Items.Add(Edit1.Text);
        ComboBox1.Items.Clear;
        ComboBox2.Items.Clear;
        Form3.Close;
      end;
    1:begin
        Inc(GrafCount);
        SetLength(Grafiki, GrafCount);
        Grafiki[GrafCount-1]:=Grafiki[Combobox1.itemindex].SubG(Grafiki[Combobox2.itemindex]);
        Grafiki[GrafCount-1].GrafName:=Edit1.Text;
        Form1.ComboBox1.Items.Add(Edit1.Text);
        ComboBox1.Items.Clear;
        ComboBox2.Items.Clear;
        Form3.Close;
      end;
    2:begin
        Inc(GrafCount);
        SetLength(Grafiki, GrafCount);
        Grafiki[GrafCount-1]:=Grafiki[Combobox2.itemindex].CopyGraf;
        Grafiki[GrafCount-1].GrafName:=Edit1.Text;
        Grafiki[GrafCount-1].SetMaxY(Grafiki[Combobox1.itemindex].GetMaxY);
        Grafiki[GrafCount-1].SetMinY(Grafiki[Combobox1.itemindex].GetMinY);
        if not CheckBox1.Checked then begin
          Grafiki[GrafCount-1].SetMaxX(Grafiki[Combobox1.itemindex].GetMaxX);
          Grafiki[GrafCount-1].SetMinX(Grafiki[Combobox1.itemindex].GetMinX);
          CheckBox1.Checked:=True;
        end;
        Form1.ComboBox1.Items.Add(Edit1.Text);
        ComboBox1.Items.Clear;
        ComboBox2.Items.Clear;
        CheckBox1.Visible:=False;
        Form3.Close;
      end;
    else ShowMessage('Выберите действие над графиками');
    end;
  end;
end;

procedure TForm3.BitBtn2Click(Sender: TObject);
begin
  CheckBox1.Checked:=True;
  CheckBox1.Visible:=False;
end;

end.

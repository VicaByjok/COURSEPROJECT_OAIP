unit Unit1;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ColorGrd, ComCtrls, StdCtrls, Buttons, ExtCtrls, Menus, ExtDlgs,
  Math;

type
  TForm1 = class(TForm)
    mm1: TMainMenu;
    mmiFile: TMenuItem;
    mmiCreate: TMenuItem;
    mmiOpen: TMenuItem;
    mmiSave: TMenuItem;
    mmiSaveAs: TMenuItem;
    mmiExit: TMenuItem;
    mmiStep: TMenuItem;
    pnl1: TPanel;
    btn1: TSpeedButton;
    btn2: TSpeedButton;
    btn3: TSpeedButton;
    btn4: TSpeedButton;
    btn8: TSpeedButton;
    edt1: TEdit;
    ud1: TUpDown;
    pnl2: TPanel;
    clrgrd1: TColorGrid;
    bvl1: TBevel;
    pnl3: TPanel;
    pnl4: TPanel;
    scrlbx1: TScrollBox;
    img1: TImage;
    stat1: TStatusBar;
    dlgOPic1: TOpenPictureDialog;
    dlg1: TSavePictureDialog;
    lbl1: TLabel;
    img2: TImage;
    img3: TImage;
    mmiStepBack: TMenuItem;
    mmiStepForward: TMenuItem;
    N9: TMenuItem;
    mmiWipeOff: TMenuItem;
    mmiSize: TMenuItem;
    mmiHelp: TMenuItem;
    mmiAboutDeveloper: TMenuItem;
    btnRoundRect: TSpeedButton;
    btnRombus: TSpeedButton;
    btnProcedure: TSpeedButton;
    btnHandEnter: TSpeedButton;
    btnUpCycle: TSpeedButton;
    btnDownCycle: TSpeedButton;
    SpeedButton1: TSpeedButton;
    FontDialog1: TFontDialog;
    SpeedButton2: TSpeedButton;
    SpeedButton3: TSpeedButton;
    SpeedButton4: TSpeedButton;
    SpeedButton6: TSpeedButton;
    SpeedButton7: TSpeedButton;
    procedure CreateMemo(x, y, x1, y1: Integer);
    procedure FormCreate(Sender: TObject);
    procedure mmiOpenClick(Sender: TObject);
    procedure ud1Click(Sender: TObject; Button: TUDBtnType);
    procedure img1MouseMove(Sender: TObject; Shift: TShiftState; x, y: Integer);
    procedure edt1Change(Sender: TObject);
    procedure img1MouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; x, y: Integer);
    procedure btn5Click(Sender: TObject);
    procedure mmiStepBackClick(Sender: TObject);
    procedure mmiStepForwardClick(Sender: TObject);
    procedure mmiWipeOffClick(Sender: TObject);
    procedure mmiSizeClick(Sender: TObject);
    procedure mmiSaveClick(Sender: TObject);
    procedure mmiSaveAsClick(Sender: TObject);
    procedure mmiCreateClick(Sender: TObject);
    procedure mmiExitClick(Sender: TObject);
    procedure img1MouseUp(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; x, y: Integer);
    procedure mmiAboutDeveloperClick(Sender: TObject);
    procedure btnRoundRectMouseMove(Sender: TObject; Shift: TShiftState;
      x, y: Integer);
    procedure SpeedButton1Click(Sender: TObject);
    procedure SpeedButton2Click(Sender: TObject);
    procedure SpeedButton3Click(Sender: TObject);
    procedure SpeedButton4Click(Sender: TObject);
    procedure PNG1Click(Sender: TObject);
    procedure btn1Click(Sender: TObject);
    procedure img1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;
  a, b, c, d: Integer;
  x3, y3: Real;
  x1, y1, x2, y2, fat: Integer;
  mb: char;
  flag, front: Integer;
  fname: string;
  backp, nextp, fopen, fsave: boolean;

implementation

uses Unit2, {Unit3,} Unit4;

{$R *.dfm}


//������� ��� �������� �����
procedure TForm1.FormCreate(Sender: TObject); // ������� ���������
begin
  fsave := true;
  img1.Canvas.FillRect(img1.Canvas.ClipRect);
  // ��������� �p�����������, ��������� ����� Brush, �� �p���� � ������ �p����,
  // �������������, �� ������� ���������� ����������� �����.
  img2.Canvas.FillRect(img2.Canvas.ClipRect);
  img3.Canvas.FillRect(img3.Canvas.ClipRect);
end;


// �������� ��� ������������� ��������������� �����
procedure TForm1.mmiOpenClick(Sender: TObject);
begin
  img1.AutoSize := true; // �������� AutoSize  ���
  fopen := true;
  dlgOPic1.Execute;
  img1.Picture.LoadFromFile(dlgOPic1.FileName); // �������� �����������
  fname := dlgOPic1.FileName;
  img1.AutoSize := false; // AutoSize image'a ����
  end;


//  ��������� ������� �����
procedure TForm1.ud1Click(Sender: TObject; Button: TUDBtnType);
begin
  begin
    front := StrToInt(edt1.Text);
    if front <> 0 then
    begin
      if Button = btprev then
      begin
        dec(front);
        if front = 0 then
          front := 1;
        edt1.Text := IntToStr(front);
      end;
      if Button = btnext then
      begin
        Inc(front);
        edt1.Text := IntToStr(front);
      end;
    end;
  end;
end;


// �������� ���������� Memo
procedure TForm1.CreateMemo(x, y, x1, y1: Integer);
var
  Memo: TMemo;
begin
  Memo := TMemo.Create(Form1);
  Memo.Parent := Form1;
  Memo.Alignment := taCenter;
  Memo.Color := clWindow;
  Memo.BorderStyle := bsNone;
  Memo.Left := a;
  Memo.Top := b;
  Memo.Width := c;
  Memo.Height := d;
end;



// ���������� ���� ������� �������
procedure DrawArrowHead(Canvas: TCanvas; x, y: Integer; Angle, LW: Extended);
var
  A1, A2: Extended;
  Arrow: array [0 .. 2] of TPoint;
const
  Beta = 0.322;
  LineLen = 3;
begin
  Angle := Pi + Angle;
  Arrow[0] := Point(x, y);
  A1 := Angle - Beta;
  A2 := Angle + Beta;
  Arrow[1] := Point(x + Round(LineLen * LW * Cos(A1)),
    y - Round(LineLen * LW * Sin(A1)));
  Arrow[2] := Point(x + Round(LineLen * LW * Cos(A2)),
    y - Round(LineLen * LW * Sin(A2)));
  Canvas.Brush.Color := clBlack;
  Canvas.Polygon(Arrow);
end;



// �������
procedure DrawArrow(Canvas: TCanvas; x1, y1, x2, y2: Integer; LW: Extended);
var
  Angle: Extended;
begin
  Angle := ArcTan2(y1 - y2, x2 - x1);
  Canvas.MoveTo(x1, y1);
  Canvas.LineTo(x2 - Round(2 * LW * Cos(Angle)),
    y2 + Round(2 * LW * Sin(Angle)));
  DrawArrowHead(Canvas, x2, y2, Angle, LW);
end;


// ��������
procedure TForm1.img1MouseMove(Sender: TObject; Shift: TShiftState;
  x, y: Integer);
begin
  stat1.Panels[0].Text := '������� ��� ���������';
  stat1.Panels[1].Text := 'x:' + IntToStr(x) + ' y:' + IntToStr(y);
  if ((ssRight in Shift) or (ssLeft in Shift)) then
  begin
    fsave := false;
    backp := true;
    nextp := false;

    // ������
    if btn1.Down then
    begin
      img1.Canvas.Pen.Color := pnl3.Color;
      img1.Canvas.Pen.Width := StrToInt((edt1.Text));
      img1.Canvas.LineTo(x, y);
    end;

    // �������������
    if btn8.Down then
    begin
      img1.Picture.Assign(img2.Picture);
      img1.Canvas.Pen.Width := StrToInt(edt1.Text);
      if mb = 'r' then
        img1.Canvas.Pen.Color := pnl3.Color
      else
        img1.Canvas.Brush.Style := bsSolid;
      img1.Canvas.Rectangle(x, y, x1, y1);
    end;

    // ������
    if btnProcedure.Down then
    begin
      img1.Picture.Assign(img2.Picture);
      img1.Canvas.Pen.Width := StrToInt(edt1.Text);
      if mb = 'r' then
        img1.Canvas.Pen.Color := pnl3.Color
      else
        x3 := (x - x1) / 3;
      img1.Canvas.Brush.Style := bsSolid;
      img1.Canvas.Polygon([Point(x1, y1), Point(x1 - Round(x3), y), Point(x, y),
        Point(x + Round(x3), y1)]);
    end;

    //������ ����
    if btnHandEnter.Down then
    begin
      img1.Picture.Assign(img2.Picture);
      img1.Canvas.Pen.Width := StrToInt(edt1.Text);
      if mb = 'r' then
        img1.Canvas.Pen.Color := pnl3.Color
      else
        y3 := (y - y1) / 2;
      img1.Canvas.Brush.Style := bsSolid;
      img1.Canvas.Polygon([Point(x1, y1), Point(x1, y), Point(x, y),
        Point(x, y1), Point(x, y1 - Round(y3))]);
    end;

    //����� �� �����
    if btnUpCycle.Down then
    begin
      img1.Picture.Assign(img2.Picture);
      img1.Canvas.Pen.Width := StrToInt(edt1.Text);
      if mb = 'r' then
        img1.Canvas.Pen.Color := pnl3.Color
      else
        x3 := (x - x1) / 5;
      y3 := (y - y1) / 5;
      img1.Canvas.Brush.Style := bsSolid;
      img1.Canvas.Polygon([Point(x1, y1), Point(x1, y), Point(x, y),
        Point(x, y1), Point(x - Round(x3), y1 - Round(y3)),
        Point(x1 + Round(x3), y1 - Round(y3))]);
    end;

    //���� �� �����
    if btnDownCycle.Down then
    begin
      img1.Picture.Assign(img2.Picture);
      img1.Canvas.Pen.Width := StrToInt(edt1.Text);
      if mb = 'r' then
        img1.Canvas.Pen.Color := pnl3.Color
      else
        x3 := (x - x1) / 5;
      y3 := (y - y1) / 5;
      img1.Canvas.Brush.Style := bsSolid;
      img1.Canvas.Polygon([Point(x1, y1), Point(x1, y), Point(x1 + Round(x3),
        y + Round(y3)), Point(x - Round(x3), y + Round(y3)), Point(x, y),
        Point(x, y1)]);
    end;
    a := x1 + 87;
    b := y1 + 15;
    c := x - x1 - 8;
    d := y - y1 - 8;

    // �����
    if btn4.Down then
    begin
      img1.Picture.Assign(img2.Picture);
      if mb = 'l' then
        img1.Canvas.Pen.Color := pnl4.Color
      else
        img1.Canvas.Pen.Color := pnl3.Color;
      img1.Canvas.Pen.Width := StrToInt(edt1.Text);
      img1.Canvas.MoveTo(x, y);
      img1.Canvas.LineTo(x1, y1);
      a := 0;
      b := 0;
      c := 0;
      d := 0;
    end;

    // ����������
    if btnRoundRect.Down then
    begin
      img1.Picture.Assign(img2.Picture);
      img1.Canvas.Pen.Width := StrToInt(edt1.Text);
      if mb = 'r' then
        img1.Canvas.Pen.Color := pnl3.Color
      else
        img1.Canvas.Brush.Style := bsSolid;
      img1.Canvas.RoundRect(x, y, x1, y1, 100, 100);
      a := x1 + 119;
      b := y1 + 15;
      c := x - x1 - 71;
      d := y - y1 - 8;
    end;

    // �������
    if btnRombus.Down then
    begin
      img1.Picture.Assign(img2.Picture);
      img1.Canvas.Pen.Width := StrToInt(edt1.Text);
      if mb = 'r' then
        img1.Canvas.Pen.Color := pnl3.Color
      else
        x3 := (x - x1) / 2;
      y3 := (y - y1) / 2;
      img1.Canvas.Brush.Style := bsSolid;
      img1.Canvas.Polygon([Point(x1, y1), Point(x1 + Round(x3), y1 - Round(y3)),
        Point(x, y1), Point(x + Round(x3), y1 + Round(y3)), Point(x, y),
        Point(x1 + Round(x3), y + Round(y3)), Point(x1, y),
        Point(x1 - Round(x3), y1 + Round(y3))]);
      a := x1 + 84;
      b := y1 + 10;
      c := x - x1 - 3;
      d := y - y1;
    end;

    // ����� �� ��������
    if SpeedButton6.Down then
    begin
      img1.Picture.Assign(img2.Picture);
      if mb = 'l' then
        img1.Canvas.Pen.Color := pnl4.Color
      else
        img1.Canvas.Pen.Color := pnl3.Color;
      img1.Canvas.Pen.Width := StrToInt(edt1.Text);
      Form1.Canvas.Pen.Color := clBlack;
      Form1.Canvas.Pen.Width := 2;
      Form1.Canvas.Brush.Color := clBlack;
      img1.Canvas.MoveTo(x, y);
      DrawArrow(Form1.img1.Canvas, x1, y1, x, y, 4);
      a := 0;
      b := 0;
      c := 0;
      d := 0;
    end;

    // �������� �����
    if SpeedButton7.Down then
    begin
      img1.Picture.Assign(img2.Picture);
      img1.Canvas.Pen.Width := StrToInt(edt1.Text);
      if mb = 'r' then
        img1.Canvas.Pen.Color := clWhite
      else
      begin
        img1.Canvas.Brush.Style := bsSolid;
        img1.Canvas.Pen.Color := clWhite
      end;
      img1.Canvas.Rectangle(x, y, x1, y1);
    end;

  end;
  x2 := x;
  y2 := y;
end;


 // ������ � ��������
procedure TForm1.img1MouseUp(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; x, y: Integer);
begin
  // �������
  if btn2.Down then
  begin
    if Button = mbRight then
      img1.Canvas.Brush.Color := pnl3.Color
    else
      img1.Canvas.Brush.Color := pnl4.Color;
    img1.Canvas.FloodFill(x, y, img1.Canvas.Pixels[x, y], fssurface);
  end;
  // �������
  if btn3.Down then
  begin
    if Button = mbRight then
      pnl3.Color := img1.Canvas.Pixels[x, y]
    else
      pnl4.Color := img1.Canvas.Pixels[x, y];
  end;
  CreateMemo(a, b, c, d);
end;


// ���������
procedure TForm1.img1MouseDown(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; x, y: Integer);
begin
  img2.Picture.Assign(img1.Picture);
  x1 := x;
  y1 := y;
  if Button = mbRight then
    mb := 'r'
  else
    mb := 'l';
  img1.Canvas.MoveTo(x, y);
  img1MouseMove(Sender, Shift, x, y);
end;


// ��������� ������� �����
procedure TForm1.edt1Change(Sender: TObject);
begin
  fat := StrToInt(edt1.Text);
  if edt1.Text = '0' then
    Messagedlg('������� �� ����� ���� ����� 0!', mtInformation, [mbok], 0);
  if edt1.Text = '0' then
    edt1.Text := '1';

end;

procedure TForm1.btn5Click(Sender: TObject);
begin
  img1.Canvas.Pen.Width := 1;
  lbl1.Visible := false;
  edt1.Visible := false;
end;


// ��� �����
procedure TForm1.mmiStepBackClick(Sender: TObject);
var
  i: Integer;
  c: TControl;
begin
  for i := self.ControlCount - 1 downto self.ControlCount - 1 do
  begin
    c := self.Controls[i];
    if c is TMemo then
    begin
      c.Hide;
    end;
  end;

  if backp = true then
  begin
    img3.Picture.Assign(img1.Picture);
    img1.Picture.Assign(img2.Picture);
    nextp := true;
  end;
  backp := false;
end;


// ��� ������
procedure TForm1.mmiStepForwardClick(Sender: TObject);
var
  c: TControl;
begin
  if nextp = true then
  begin
    img2.Picture.Assign(img1.Picture);
    img1.Picture.Assign(img3.Picture);
    backp := true;
  end;
  nextp := false;
  begin
    c := self.Controls[self.ControlCount - 1];
    if c is TMemo then
    begin
      c.Show;
    end;
  end;
end;


// �������
procedure TForm1.mmiWipeOffClick(Sender: TObject);
var
  i: Integer;
  c: TControl;
begin
  img1.Picture := nil;
  img1.Canvas.FillRect(img1.Canvas.ClipRect);
  img2.Picture := nil;
  img2.Canvas.FillRect(img2.Canvas.ClipRect);
  img3.Picture := nil;
  img3.Canvas.FillRect(img3.Canvas.ClipRect);
  backp := false;
  nextp := false;
  for i := self.ControlCount - 1 downto 0 do
  begin
    c := self.Controls[i];
    if c is TMemo then
    begin
      c.Parent := nil;
      c.Free;
    end;
  end;
end;


// ��������� ��������
procedure TForm1.mmiSizeClick(Sender: TObject);
begin
  Form2.ShowModal;
end;

procedure TForm1.btnRoundRectMouseMove(Sender: TObject; Shift: TShiftState;
  x, y: Integer);
begin
  stat1.Panels[0].Text := '��������� �������� ��������������';
end;


// ���������
procedure TForm1.mmiSaveClick(Sender: TObject);
var
  bmp: TBitmap;
begin
  if fopen then
  begin
    try
      bmp := TBitmap.Create;
      bmp.Assign(img1.Picture);
      bmp.SaveTofile(ChangeFileExt(fname, '.bmp'));
    finally
      bmp.Free;
    end;
  end
  else
  begin
    dlg1.Execute;
    try
      bmp := TBitmap.Create;
      bmp.Assign(img1.Picture);
      bmp.SaveTofile(ChangeFileExt(dlg1.FileName, '.bmp'));
    finally
      bmp.Free;
    end;
    fopen := true;
  end;
  fsave := true;
end;


// ��������� ���
procedure TForm1.mmiSaveAsClick(Sender: TObject);
var
  bmp: TBitmap;
begin
  dlg1.Execute;
  try
    bmp := TBitmap.Create;
    bmp.Assign(img1.Picture);
    bmp.SaveTofile(ChangeFileExt(dlg1.FileName, '.bmp'));
  finally
    bmp.Free;
  end;
  fsave := true;
end;


// ���������� ���������
procedure TForm1.mmiCreateClick(Sender: TObject);
begin
  if fsave <> true then
  begin
    Form4.ShowModal;
  end
  else
  begin
    fopen := false;
    img1.Picture := nil;
    img1.Canvas.FillRect(img1.Canvas.ClipRect);
    img2.Picture := nil;
    img2.Canvas.FillRect(img2.Canvas.ClipRect);
    img3.Picture := nil;
    img3.Canvas.FillRect(img3.Canvas.ClipRect);
    backp := false;
    nextp := false;
  end;
end;


// �����
procedure TForm1.mmiExitClick(Sender: TObject);
begin
  if fsave <> true then
  begin
    Form4.ShowModal;
  end;
  if fsave = true then
    Form1.Close;
end;


//���������� � ������������
procedure TForm1.mmiAboutDeveloperClick(Sender: TObject);
begin
  Messagedlg('��������� ����������� ����� ���������, ��.851002', mtInformation,  [mbok], 0);
end;


// �������������� ������
procedure TForm1.SpeedButton1Click(Sender: TObject);
var
  i: Integer;
  Memo: TMemo;
  c: TControl;
begin
  if FontDialog1.Execute then
    for i := self.ControlCount - 1 downto 0 do
    begin
      c := self.Controls[i];
      if c is TMemo then
      begin
        Font.size := FontDialog1.Font.size;
        Font.Style := FontDialog1.Font.Style;
        Font.Color := FontDialog1.Font.Color;
      end;
    end;
  edt1.Font.size := 8;
  clrgrd1.Font.size := 8;
  lbl1.Font.size := 8;
  edt1.Font.Style := edt1.Font.Style - [fsBold];
  edt1.Font.Style := edt1.Font.Style - [fsItalic];
  edt1.Font.Style := edt1.Font.Style - [fsUnderline];
  lbl1.Font.Style := lbl1.Font.Style - [fsBold];
  lbl1.Font.Style := lbl1.Font.Style - [fsItalic];
  lbl1.Font.Style := lbl1.Font.Style - [fsUnderline];
end;


// ������
procedure TForm1.SpeedButton2Click(Sender: TObject);
var
  i: Integer;
  c: TControl;
begin
  for i := self.ControlCount - 1 downto 0 do
  begin
    c := self.Controls[i];
    if c is TMemo then
    begin
      Font.Style := Font.Style + [fsBold];
    end;
  end;
  clrgrd1.Font.size := 8;
  edt1.Font.Style := edt1.Font.Style - [fsBold];
  lbl1.Font.Style := lbl1.Font.Style - [fsBold];
end;


// ������
procedure TForm1.SpeedButton3Click(Sender: TObject);
var
  i: Integer;
  c: TControl;
begin
  for i := self.ControlCount - 1 downto 0 do
  begin
    c := self.Controls[i];
    if c is TMemo then
    begin
      Font.Style := Font.Style + [fsItalic];
      Font.Name := 'TimesNewRoman';
    end;
  end;
  clrgrd1.Font.size := 8;
  edt1.Font.Name := 'MS Sans Serif';
  lbl1.Font.Name := 'MS Sans Serif';
  edt1.Font.Style := edt1.Font.Style - [fsItalic];
  lbl1.Font.Style := lbl1.Font.Style - [fsItalic];
end;


// �������������
procedure TForm1.SpeedButton4Click(Sender: TObject);
var
  i: Integer;
  c: TControl;
begin
  for i := self.ControlCount - 1 downto 0 do
  begin
    c := self.Controls[i];
    if c is TMemo then
    begin
      Font.Style := Font.Style + [fsUnderline];
      Font.Name := 'TimesNewRoman';
    end;
  end;
  clrgrd1.Font.size := 8;
  edt1.Font.Name := 'MS Sans Serif';
  lbl1.Font.Name := 'MS Sans Serif';
  edt1.Font.Style := edt1.Font.Style - [fsUnderline];
  lbl1.Font.Style := lbl1.Font.Style - [fsUnderline];
end;

procedure TForm1.PNG1Click(Sender: TObject);
var
  bmp: TBitmap;
begin
  dlg1.Execute;
  try
    bmp := TBitmap.Create;
    bmp.Assign(img1.Picture);
    bmp.SaveTofile(ChangeFileExt(dlg1.FileName, '.bmp'));
  finally
    bmp.Free;
  end;
  fsave := true;
end;

procedure TForm1.btn1Click(Sender: TObject);
begin
  lbl1.Visible := true;
  edt1.Visible := true;
  ud1.Visible := true;
end;

end.

unit Unit1;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes,
  System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs, FMX.Objects,
  FMX.Layouts;

type
  TForm1 = class(TForm)
    Pie1: TPie;
    Pie2: TPie;
    Pie3: TPie;
    Pie4: TPie;
    Pie5: TPie;
    GridPanelLayout1: TGridPanelLayout;
    Rectangle1: TRectangle;
    Rectangle2: TRectangle;
    procedure FormKeyUp(Sender: TObject; var Key: Word; var KeyChar: Char;
      Shift: TShiftState);
    procedure FormCreate(Sender: TObject);
  private
    FOptionSelectionnee: TShape;
    procedure SetOptionSelectionnee(const Value: TShape);
    { D�clarations priv�es }
    property OptionSelectionnee: TShape read FOptionSelectionnee
      write SetOptionSelectionnee;
    procedure VersLeBas;
    procedure VersLeHaut;
    procedure VersLaGauche;
    procedure VersLaDroite;
    procedure ActiveOption;
  public
    { D�clarations publiques }
  end;

var
  Form1: TForm1;

implementation

{$R *.fmx}

uses Unit2, Unit3, Unit4, Unit5, Unit6, Unit7, FMX.Styles, JoystickManager;

{ TForm1 }

procedure TForm1.ActiveOption;
begin
  if OptionSelectionnee = Pie1 then
    form2.Show
  else if OptionSelectionnee = Pie2 then
    form3.Show
  else if OptionSelectionnee = Pie3 then
    form4.Show
  else if OptionSelectionnee = Pie4 then
    form5.Show
  else if OptionSelectionnee = Pie5 then
    form6.Show
  else if OptionSelectionnee = Rectangle1 then
    StyleBook := DataModule7.StyleBook1
  else if OptionSelectionnee = Rectangle2 then
    StyleBook := DataModule7.StyleBook2;
end;

procedure TForm1.FormCreate(Sender: TObject);
begin
  OptionSelectionnee := Pie3;
  StartJoystick;
end;

procedure TForm1.FormKeyUp(Sender: TObject; var Key: Word; var KeyChar: Char;
  Shift: TShiftState);
begin
  case Key of
    vkHardwareBack, vkEscape:
      close;
    vkleft:
      VersLaGauche;
    vkUp:
      VersLeHaut;
    vkRight:
      VersLaDroite;
    vkDown:
      VersLeBas;
    0, vkReturn:
      if KeyChar = #0 then
        ActiveOption;
  end;
end;

procedure TForm1.SetOptionSelectionnee(const Value: TShape);
begin
  if Assigned(FOptionSelectionnee) then
  begin
    FOptionSelectionnee.Stroke.Color := talphacolors.Black;
    FOptionSelectionnee.Fill.Color := talphacolors.lightgray;
  end;
  FOptionSelectionnee := Value;
  FOptionSelectionnee.Stroke.Color := talphacolors.yellow;
  FOptionSelectionnee.Fill.Color := talphacolors.green;
end;

procedure TForm1.VersLaDroite;
begin
  if OptionSelectionnee = Pie4 then
    OptionSelectionnee := Pie5
  else if OptionSelectionnee = Pie3 then
    OptionSelectionnee := Pie2
  else if OptionSelectionnee = Pie2 then
    OptionSelectionnee := Pie1
  else if OptionSelectionnee = Rectangle1 then
    OptionSelectionnee := Rectangle2;
end;

procedure TForm1.VersLaGauche;
begin
  if OptionSelectionnee = Pie5 then
    OptionSelectionnee := Pie4
  else if OptionSelectionnee = Pie2 then
    OptionSelectionnee := Pie3
  else if OptionSelectionnee = Pie1 then
    OptionSelectionnee := Pie2
  else if OptionSelectionnee = Rectangle2 then
    OptionSelectionnee := Rectangle1;
end;

procedure TForm1.VersLeBas;
begin
  if OptionSelectionnee = Pie5 then
    OptionSelectionnee := Pie1
  else if OptionSelectionnee = Pie3 then
    OptionSelectionnee := Pie2
  else if OptionSelectionnee = Pie4 then
    OptionSelectionnee := Pie3
  else if OptionSelectionnee = Pie2 then
    OptionSelectionnee := Rectangle1
  else if OptionSelectionnee = Pie1 then
    OptionSelectionnee := Rectangle2;
end;

procedure TForm1.VersLeHaut;
begin
  if OptionSelectionnee = Pie1 then
    OptionSelectionnee := Pie5
  else if OptionSelectionnee = Pie2 then
    OptionSelectionnee := Pie3
  else if OptionSelectionnee = Pie3 then
    OptionSelectionnee := Pie4
  else if OptionSelectionnee = Rectangle1 then
    OptionSelectionnee := Pie2
  else if OptionSelectionnee = Rectangle2 then
    OptionSelectionnee := Pie1;
end;

end.

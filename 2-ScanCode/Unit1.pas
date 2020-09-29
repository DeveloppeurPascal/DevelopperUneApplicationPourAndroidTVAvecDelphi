unit Unit1;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes,
  System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs, FMX.Memo.Types,
  FMX.Controls.Presentation, FMX.ScrollBox, FMX.Memo, FMX.StdCtrls;

type
  TForm1 = class(TForm)
    Memo1: TMemo;
    procedure FormKeyDown(Sender: TObject; var Key: Word; var KeyChar: Char;
      Shift: TShiftState);
    procedure FormKeyUp(Sender: TObject; var Key: Word; var KeyChar: Char;
      Shift: TShiftState);
  private
    { Déclarations privées }
  public
    { Déclarations publiques }
  end;

var
  Form1: TForm1;

implementation

{$R *.fmx}

procedure TForm1.FormKeyDown(Sender: TObject; var Key: Word; var KeyChar: Char;
  Shift: TShiftState);
var
  s: string;
begin // cf System.UITypes
  // if ord(KeyChar) >= ord(' ') then
  // s := Key.ToString + ' - ' + ord(KeyChar).ToString + ' - ' + KeyChar
  // else
  // s := Key.ToString + ' - ' + ord(KeyChar).ToString;
  // Memo1.Lines.Insert(0, 'KeyDown : ' + s);
  // Key := 0;
  // KeyChar := #0;
end;

procedure TForm1.FormKeyUp(Sender: TObject; var Key: Word; var KeyChar: Char;
  Shift: TShiftState);
var
  s: string;
begin // cf System.UITypes
  if ord(KeyChar) >= ord(' ') then
    s := Key.ToString + ' - ' + ord(KeyChar).ToString + ' - ' + KeyChar
  else
    s := Key.ToString + ' - ' + ord(KeyChar).ToString;
  Memo1.Lines.Insert(0, 'KeyUp : ' + s);
  Key := 0;
  KeyChar := #0;
end;

end.

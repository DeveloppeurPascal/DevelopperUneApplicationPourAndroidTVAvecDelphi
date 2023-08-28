program NavigationJoystick;

uses
  System.StartUpCopy,
  FMX.Forms,
  Unit1 in 'Unit1.pas' {Form1},
  Unit2 in 'Unit2.pas' {Form2},
  Unit3 in 'Unit3.pas' {Form3},
  Unit4 in 'Unit4.pas' {Form4},
  Unit5 in 'Unit5.pas' {Form5},
  Unit6 in 'Unit6.pas' {Form6},
  Unit7 in 'Unit7.pas' {DataModule7: TDataModule},
  Gamolf.FMX.Joystick in 'lib-externe\Delphi-Game-Engine\src\Gamolf.FMX.Joystick.pas',
  Gamolf.RTL.Joystick in 'lib-externe\Delphi-Game-Engine\src\Gamolf.RTL.Joystick.pas',
  Gamolf.RTL.Joystick.Windows in 'lib-externe\Delphi-Game-Engine\src\Gamolf.RTL.Joystick.Windows.pas',
  JoystickManager in 'JoystickManager.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TForm1, Form1);
  Application.CreateForm(TForm2, Form2);
  Application.CreateForm(TForm3, Form3);
  Application.CreateForm(TForm4, Form4);
  Application.CreateForm(TForm5, Form5);
  Application.CreateForm(TForm6, Form6);
  Application.CreateForm(TDataModule7, DataModule7);
  Application.Run;
end.
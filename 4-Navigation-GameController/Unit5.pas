/// <summary>
/// ***************************************************************************
///
/// Développer une application pour Android TV avec Delphi
///
/// Copyright 2020-2024 Patrick Prémartin under MIT license.
///
/// THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
/// IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
/// FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL
/// THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
/// LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING
/// FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER
/// DEALINGS IN THE SOFTWARE.
///
/// ***************************************************************************
///
/// Sources des exemples et démonstrations liées au webinaire
/// "Développer une application pour Android TV avec Delphi" du 29 Septembre
/// 2020.
///
/// ***************************************************************************
///
/// Author(s) :
///      Patrick PREMARTIN
///
/// Site :
///      https://serialstreameur.fr/webinaire-20200929.php
///
/// Project site :
///      https://github.com/DeveloppeurPascal/DevelopperUneApplicationPourAndroidTVAvecDelphi
///
/// ***************************************************************************
/// File last update : 03/08/2024 16:05:49
/// Signature : a98c35579052c354012e05659c6a2b7ebfe833b1
/// ***************************************************************************
/// </summary>

unit Unit5;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes,
  System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs, FMX.Objects;

type
  TForm5 = class(TForm)
    Text1: TText;
    procedure FormKeyUp(Sender: TObject; var Key: Word; var KeyChar: Char;
      Shift: TShiftState);
  private
    { Déclarations privées }
  public
    { Déclarations publiques }
  end;

var
  Form5: TForm5;

implementation

{$R *.fmx}

procedure TForm5.FormKeyUp(Sender: TObject; var Key: Word; var KeyChar: Char;
  Shift: TShiftState);
begin
  case Key of
    vkHardwareBack, vkEscape:
      close;
  end;
end;

end.

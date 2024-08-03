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
/// File last update : 03/08/2024 16:05:25
/// Signature : 08337969a3af2d9b776d0f4e6a1305199a62e689
/// ***************************************************************************
/// </summary>

program HelloWorld;

uses
  System.StartUpCopy,
  FMX.Forms,
  fMain in 'fMain.pas' {Form1};

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TForm1, Form1);
  Application.Run;
end.

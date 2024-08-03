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
/// File last update : 03/08/2024 16:05:43
/// Signature : 89909bd754ab0916e9935f8cb41fbf489e8c27ea
/// ***************************************************************************
/// </summary>

unit JoystickManager;

interface

procedure StartJoystick;

implementation

uses
  System.Classes, System.UITypes, FMX.Forms,
  Gamolf.RTL.Joystick, FMX.Platform;

var
  JoystickService: IGamolfJoystickService;

procedure StartJoystick;
begin
  if TPlatformServices.Current.SupportsPlatformService(IGamolfJoystickService,
    JoystickService) then
    tthread.CreateAnonymousThread(
      procedure
      var
        Infos: TJoystickInfo;
        ID: integer;
        DPad: word;
        Key: word;
        KeyChar: char;
        ClickedJoystickID: tjoystickid;
        ClickedKey: word;
      begin
        try
          ClickedJoystickID := JoystickService.Count + 1;
          ClickedKey := 0;
          while not tthread.CheckTerminated do
          begin // TODO : voir condition de sortie si JoystickService n'existe plus avant sortie du thread
            tthread.sleep(50);
            for ID := 0 to JoystickService.Count - 1 do
              if JoystickService.isConnected(ID) then
                try
                  JoystickService.getInfo(ID, Infos);
                  if JoystickService.hasDPad(ID) then
                    DPad := Infos.DPad
                  else
                    DPad := JoystickService.getDPadFromXY(Infos.Axes[0],
                      Infos.Axes[0]);
                  Key := 0;
                  if JoystickService.isDPad(DPad, TJoystickDPad.top) then
                    Key := vkUp
                  else if JoystickService.isDPad(DPad, TJoystickDPad.right) then
                    Key := vkright
                  else if JoystickService.isDPad(DPad, TJoystickDPad.bottom)
                  then
                    Key := vkDown
                  else if JoystickService.isDPad(DPad, TJoystickDPad.left) then
                    Key := vkleft
                  else if (length(Infos.Buttons) > 0) and Infos.Buttons[0] then
                    Key := vkreturn
                  else if (length(Infos.Buttons) > 1) and Infos.Buttons[1] then
                    Key := vkescape;
                  if (ClickedJoystickID = ID) then
                    if (ClickedKey = Key) then
                      Key := 0
                    else
                      ClickedKey := Key;
                  if Key <> 0 then
                    tthread.Synchronize(nil,
                      procedure
                      var
                        i: integer;
                        c: tcomponent;
                        f: tform;
                      begin
                        KeyChar := #0;
                        for i := 0 to application.ComponentCount - 1 do
                        begin
                          c := application.Components[i];
                          if (c is tform) then
                          begin
                            f := c as tform;
                            if f.Active then
                            begin
                              f.KeyUp(Key, KeyChar, []);
                              ClickedJoystickID := ID;
                              ClickedKey := Key;
                              break;
                            end;
                          end;
                        end;
                      end);
                except
                  // pas joli
                end;
          end;
        except
          // pas bien
        end;
      end).Start;
end;

initialization

JoystickService := nil;

end.

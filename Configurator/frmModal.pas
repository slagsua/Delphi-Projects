unit frmModal;

interface
uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs;

type
TfrmModal = class(TForm)
  private
    procedure WMSYSCOMMAND(var Msg: TWMSYSCOMMAND); message WM_SYSCOMMAND;
    procedure WMACTIVATEAPP(var Msg: TWMACTIVATEAPP); message WM_ACTIVATEAPP;
  end;

var
  frmModal: TfrmModal;

implementation

{$R *.DFM}
procedure TfrmModal.WMACTIVATEAPP(var Msg: TWMACTIVATEAPP);
 begin
   //Если приложение в свернутом состоянии,
   //то разворачиваем в нормальное
   if IsIconic(Application.Handle) then
     ShowWindow(Application.Handle, SW_RESTORE);
   inherited;
 end;

procedure TfrmModal.WMSYSCOMMAND(var Msg: TWMSYSCOMMAND);
 begin
   //Если сообщение "свернуть",
   // то сворачиваем главную форму приложения
   if Msg.CmdType = SC_MINIMIZE then
    ShowWindow(Application.Handle, SW_MINIMIZE)
   else
     inherited;
 end;
end.

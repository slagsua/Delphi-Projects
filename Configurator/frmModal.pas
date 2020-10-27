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
   //���� ���������� � ��������� ���������,
   //�� ������������� � ����������
   if IsIconic(Application.Handle) then
     ShowWindow(Application.Handle, SW_RESTORE);
   inherited;
 end;

procedure TfrmModal.WMSYSCOMMAND(var Msg: TWMSYSCOMMAND);
 begin
   //���� ��������� "��������",
   // �� ����������� ������� ����� ����������
   if Msg.CmdType = SC_MINIMIZE then
    ShowWindow(Application.Handle, SW_MINIMIZE)
   else
     inherited;
 end;
end.

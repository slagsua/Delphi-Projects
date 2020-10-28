unit conf;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ExtCtrls, ShellAPI, unitIsAdmin, help, fmConfirm;

type
  TForm1 = class(TForm)
    Panel1: TPanel;
    Panel2: TPanel;
    Button1: TButton;
    Button2: TButton;
    Button3: TButton;
    Button4: TButton;
    Button5: TButton;
    Button6: TButton;
    Button7: TButton;
    Button8: TButton;
    Button9: TButton;
    Button10: TButton;
    Button11: TButton;
    Panel3: TPanel;
    Button12: TButton;
    Button13: TButton;
    Button14: TButton;
    Button15: TButton;
    Panel4: TPanel;
    Button16: TButton;
    Button17: TButton;
    Button18: TButton;
    Panel5: TPanel;
    Button19: TButton;
    Button20: TButton;
    CheckBox1: TCheckBox;
    Button21: TButton;
    procedure Button21Click(Sender: TObject);
    procedure CheckBox1Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure Button20Click(Sender: TObject);
    procedure Button19Click(Sender: TObject);
    procedure Button18Click(Sender: TObject);
    procedure Button17Click(Sender: TObject);
    procedure Button16Click(Sender: TObject);
    procedure Button15Click(Sender: TObject);
    procedure Button14Click(Sender: TObject);
    procedure Button13Click(Sender: TObject);
    procedure Button12Click(Sender: TObject);
    procedure Button11Click(Sender: TObject);
    procedure Button10Click(Sender: TObject);
    procedure Button9Click(Sender: TObject);
    procedure Button7Click(Sender: TObject);
    procedure Button6Click(Sender: TObject);
    procedure Button5Click(Sender: TObject);
    procedure Button4Click(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure Button8Click(Sender: TObject);
    procedure Button1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

{$R *.dfm}



procedure TForm1.Button10Click(Sender: TObject);
begin
  ShellExecute(0, nil, 'Data\WinXPConfigurator\WinXpConfigurator.bat', nil, nil, SW_SHOWNORMAL);
end;

procedure TForm1.Button11Click(Sender: TObject);
begin
  ShellExecute(0, nil, 'Data\Win7Configurator\Win7Configurator.bat', nil, nil, SW_SHOWNORMAL);
end;

procedure TForm1.Button12Click(Sender: TObject);
begin
    ShellExecute(0, nil, 'Data\Server_ping.bat', nil, nil, SW_SHOWNORMAL);
end;

procedure TForm1.Button13Click(Sender: TObject);
begin
  ShellExecute(0, nil, 'Data\Tracert_Server.bat', nil, nil, SW_SHOWNORMAL);
end;

procedure TForm1.Button14Click(Sender: TObject);
begin
  ShellExecute(0, nil, 'Data\Test_API.bat', nil, nil, SW_SHOWNORMAL);
end;

procedure TForm1.Button15Click(Sender: TObject);
begin
  ShellExecute(0, nil, 'Data\Google_ping.bat', nil, nil, SW_SHOWNORMAL);
end;

procedure TForm1.Button16Click(Sender: TObject);
begin
  ShellExecute(0, nil, 'Data\Start_Watchdog.bat', nil, nil, SW_SHOWNORMAL);
end;

procedure TForm1.Button17Click(Sender: TObject);
begin
  ShellExecute(0, nil, 'Data\Kill_Disp.bat', nil, nil, SW_SHOWNORMAL);
end;

procedure TForm1.Button18Click(Sender: TObject);
begin
  ShellExecute(0, nil, 'Data\Restart_OS.bat', nil, nil, SW_SHOWNORMAL);
end;

procedure TForm1.Button19Click(Sender: TObject);
begin
  ShellExecute(0, nil, 'C:\WINDOWS\explorer.exe', nil, nil, SW_SHOWNORMAL);
end;

procedure TForm1.Button1Click(Sender: TObject);
begin
  ShellExecute(0, nil, 'Data\DSP\Win_XP\Dispatcher.application', nil, nil, SW_SHOWNORMAL);
end;

procedure TForm1.Button20Click(Sender: TObject);
begin
  ShellExecute(0, nil, 'Data\Start_Watchdog.bat', nil, nil, SW_SHOWNORMAL);
  ShellExecute(0, nil, 'Data\Kill_explorer.bat', nil, nil, SW_SHOWNORMAL);
end;

procedure TForm1.Button21Click(Sender: TObject);
begin
  Form2.showModal;
end;

procedure TForm1.Button2Click(Sender: TObject);
begin
  ShellExecute(0, nil, 'Data\DSP\Win7\Dispatcher.application', nil, nil, SW_SHOWNORMAL);
end;

procedure TForm1.Button3Click(Sender: TObject);
begin
  ShellExecute(0, nil, 'Data\WatchDog\WatchDog.application', nil, nil, SW_SHOWNORMAL);
end;

procedure TForm1.Button4Click(Sender: TObject);
var CF:TSHFileOpStruct;

begin
 CreateDir('C:\Dispatcher');
 CreateDir('C:\Dispatcher\Multimedia');
 CF.Wnd:=0;
 CF.pFrom:='Data\Multimedia\Multimedia\*.*';
 CF.pTo:='C:\Dispatcher\Multimedia\';
 CF.wFunc:=FO_COPY;
 CF.fFlags:=FOF_ALLOWUNDO + FOF_NOCONFIRMATION + FOF_MULTIDESTFILES;
 if ShFileOperation(CF) = 0 then showmessage('Файлы успешно скопированы');
end;

procedure TForm1.Button5Click(Sender: TObject);
begin
  ShellExecute(0, nil, 'Data\Watcdog ADD.bat', nil, nil, SW_SHOWNORMAL);
end;

procedure TForm1.Button6Click(Sender: TObject);
begin
  Form3.ShowModal;
  if Form3.ModalResult=mrYes then
    ShellExecute(0, nil, 'Data\del_20.bat', nil, nil, SW_SHOWNORMAL);
end;

procedure TForm1.Button7Click(Sender: TObject);
begin
  Form3.ShowModal;
  if Form3.ModalResult=mrYes then
    ShellExecute(0, nil, 'Data\DataBase_rename.bat', nil, nil, SW_SHOWNORMAL);
end;

procedure TForm1.Button8Click(Sender: TObject);
begin
  Form3.ShowModal;
  if Form3.ModalResult=mrYes then
    ShellExecute(0, nil, 'Data\Config_Del.bat', nil, nil, SW_SHOWNORMAL);
end;

procedure TForm1.Button9Click(Sender: TObject);
begin
  ShellExecute(0, nil, 'Data\WinXPEmbededConfigurator\WinEmbeded.bat', nil, nil, SW_SHOWNORMAL);
end;

procedure TForm1.CheckBox1Click(Sender: TObject);
begin
  if CheckBox1.Checked = true then Form1.FormStyle:=fsStayOnTop
  else Form1.FormStyle:=fsNormal;
end;

procedure TForm1.FormCreate(Sender: TObject);
begin
  if IsUserAnAdmin then
    begin
      CheckBox1.Visible := true;
      Button19.Visible := true;
      Button21.Visible := false;
      ShellExecute(0, nil, 'Data\Kill_Disp.bat', nil, nil, SW_SHOWNORMAL);
      Form1.Caption:='Sity 24 Конфигуратор V1.0.1           Запущено с правами администратора'
    end
      else
        begin
          CheckBox1.Visible := false;
          Button19.Visible := false;
          Button21.Visible := true;
          Form1.Caption:='Sity 24 Конфигуратор V1.0.1          ОГРАНИЧЕННЫЕ ВОЗМОЖНОСТИ!!!';
        end;

end;

end.

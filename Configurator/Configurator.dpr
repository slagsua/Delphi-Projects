program Configurator;

uses
  Forms,
  conf in 'conf.pas' {Form1},
  unitIsAdmin in 'unitIsAdmin.pas',
  help in 'help.pas' {Form2},
  fmConfirm in 'fmConfirm.pas' {Form3};

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TForm1, Form1);
  Application.CreateForm(TForm2, Form2);
  Application.CreateForm(TForm3, Form3);
  Application.Run;
end.

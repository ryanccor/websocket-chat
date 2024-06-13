program Server;

uses
  Vcl.Forms,
  uMain in 'Server\uMain.pas' {frmClient};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TfrmClient, frmClient);
  Application.Run;
end.

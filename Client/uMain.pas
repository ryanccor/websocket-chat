unit uMain;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls, Vcl.StdCtrls,
  Vcl.Samples.Spin, System.Win.ScktComp;

type
  TfrmServer = class(TForm)
    pnlMessages: TPanel;
    pnlOptions: TPanel;
    edtPort: TSpinEdit;
    btnStart: TButton;
    edtHost: TEdit;
    btnStop: TButton;
    btnSend: TButton;
    edtMessage: TEdit;
    memConsole: TMemo;
    ClientSocket1: TClientSocket;
    procedure btnStartClick(Sender: TObject);
    procedure btnStopClick(Sender: TObject);
    procedure btnSendClick(Sender: TObject);
    procedure ClientSocket1Connect(Sender: TObject; Socket: TCustomWinSocket);
    procedure ClientSocket1Disconnect(Sender: TObject;
      Socket: TCustomWinSocket);
    procedure ClientSocket1Read(Sender: TObject; Socket: TCustomWinSocket);
  private
    procedure SendMessage;
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmServer: TfrmServer;

implementation

{$R *.dfm}

procedure TfrmServer.btnSendClick(Sender: TObject);
begin
  SendMessage;
end;

procedure TfrmServer.btnStartClick(Sender: TObject);
begin
  ClientSocket1.Address := edtHost.Text;
  ClientSocket1.Port := edtPort.Value;
  ClientSocket1.Active := True;
end;

procedure TfrmServer.btnStopClick(Sender: TObject);
begin
  ClientSocket1.Active := False;
end;

procedure TfrmServer.ClientSocket1Connect(Sender: TObject;
  Socket: TCustomWinSocket);
begin
  memConsole.Lines.Add('Conectado no servidor: ' + Socket.RemotePort.ToString + ':' + Socket.RemoteAddress);
end;

procedure TfrmServer.ClientSocket1Disconnect(Sender: TObject;
  Socket: TCustomWinSocket);
begin
  memConsole.Lines.Add('Desconectado do servidor: ' + Socket.RemotePort.ToString + ':' + Socket.RemoteAddress);
end;

procedure TfrmServer.ClientSocket1Read(Sender: TObject; Socket: TCustomWinSocket);
begin
  memConsole.Lines.Add('[' + Socket.RemotePort.ToString + ':' + Socket.RemoteAddress + ']');
  memConsole.Lines.Add(Socket.ReceiveText);
end;

procedure TfrmServer.SendMessage;
begin
  memConsole.Lines.Add('[' + edtPort.Text + ':' + edtHost.Text + ']');
  memConsole.Lines.Add(edtMessage.Text);
  ClientSocket1.Socket.SendText(edtMessage.Text);
  edtMessage.Clear();
end;

end.

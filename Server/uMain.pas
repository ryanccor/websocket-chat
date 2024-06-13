unit uMain;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, System.Win.ScktComp, Vcl.StdCtrls,
  Vcl.Samples.Spin, Vcl.ExtCtrls;

type
  TfrmClient = class(TForm)
    pnlOptions: TPanel;
    pnlConsole: TPanel;
    edtPort: TSpinEdit;
    btnStart: TButton;
    btnStop: TButton;
    memConsole: TMemo;
    ServerSocket1: TServerSocket;
    Panel1: TPanel;
    edtMessage: TEdit;
    btnSend: TButton;
    procedure btnStartClick(Sender: TObject);
    procedure btnStopClick(Sender: TObject);
    procedure ServerSocket1ClientConnect(Sender: TObject;
      Socket: TCustomWinSocket);
    procedure ServerSocket1ClientDisconnect(Sender: TObject;
      Socket: TCustomWinSocket);
    procedure ServerSocket1ClientRead(Sender: TObject;
      Socket: TCustomWinSocket);
    procedure btnSendClick(Sender: TObject);
  private
    procedure SendMessage;
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmClient: TfrmClient;

implementation

{$R *.dfm}

procedure TfrmClient.btnSendClick(Sender: TObject);
begin
  SendMessage;
end;

procedure TfrmClient.SendMessage;
var
  I: Integer;
begin
  if ServerSocket1.Active then
  begin
    memConsole.Lines.Add('[' + ServerSocket1.Port.ToString + ':' + 'HOST' + ']');
    memConsole.Lines.Add(edtMessage.Text);
    for I := 0 to Pred(ServerSocket1.Socket.ActiveConnections) do
    begin
      ServerSocket1.Socket.Connections[I].SendText(edtMessage.Text);
    end;
  end;
  edtMessage.Clear();
end;

procedure TfrmClient.btnStartClick(Sender: TObject);
begin
  ServerSocket1.Port := edtPort.Value;
  ServerSocket1.Active := True;
  memConsole.Lines.Add('Aplica��o iniciada na porta: ' + ServerSocket1.Port.ToString);
end;

procedure TfrmClient.btnStopClick(Sender: TObject);
begin
  ServerSocket1.Active := False;
  memConsole.Lines.Add('Aplica��o paralisada!');
end;

procedure TfrmClient.ServerSocket1ClientConnect(Sender: TObject;
  Socket: TCustomWinSocket);
begin
  memConsole.Lines.Add('Socket conectado: ' + Socket.RemotePort.ToString + ':' + Socket.RemoteAddress);
end;

procedure TfrmClient.ServerSocket1ClientDisconnect(Sender: TObject;
  Socket: TCustomWinSocket);
begin
  memConsole.Lines.Add('Socket descsonectado: ' + Socket.RemotePort.ToString + ':' + Socket.RemoteAddress);
end;

procedure TfrmClient.ServerSocket1ClientRead(Sender: TObject;
  Socket: TCustomWinSocket);
var
  I: Integer;
  msg: String;
begin
  msg := Socket.ReceiveText;
  memConsole.Lines.Add('[' + Socket.RemotePort.ToString + ':' + Socket.RemoteAddress + ']');
  memConsole.Lines.Add(msg);

  if ServerSocket1.Active then
  begin
    for I := 0 to Pred(ServerSocket1.Socket.ActiveConnections) do
       begin
         if ServerSocket1.Socket.Connections[I].SocketHandle <> Socket.SocketHandle then
           ServerSocket1.Socket.Connections[I].SendText(msg);
       end;
  end;
end;

end.

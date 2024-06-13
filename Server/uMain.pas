unit uMain;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, System.Win.ScktComp, Vcl.StdCtrls,
  Vcl.Samples.Spin, Vcl.ExtCtrls, Vcl.ComCtrls;

type
  TfrmServer = class(TForm)
    pnlOptions: TPanel;
    pnlConsole: TPanel;
    edtPort: TSpinEdit;
    btnStart: TButton;
    btnStop: TButton;
    memConsole: TMemo;
    ServerSocket1: TServerSocket;
    Panel1: TPanel;
    btnSend: TButton;
    edtMessage: TRichEdit;
    edtUsername: TEdit;
    procedure btnStartClick(Sender: TObject);
    procedure btnStopClick(Sender: TObject);
    procedure ServerSocket1ClientConnect(Sender: TObject;
      Socket: TCustomWinSocket);
    procedure ServerSocket1ClientDisconnect(Sender: TObject;
      Socket: TCustomWinSocket);
    procedure ServerSocket1ClientRead(Sender: TObject;
      Socket: TCustomWinSocket);
    procedure btnSendClick(Sender: TObject);
    procedure edtMessageKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
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

procedure TfrmServer.SendMessage;
var
  I: Integer;
  msg: String;
begin
  if ServerSocket1.Active then
  begin
    msg := edtUsername.Text + ':' + edtMessage.Text;
    memConsole.Lines.Add(msg);

    for I := 0 to Pred(ServerSocket1.Socket.ActiveConnections) do
    begin
      ServerSocket1.Socket.Connections[I].SendText(msg);
    end;
  end;
  edtMessage.Clear();
end;

procedure TfrmServer.btnStartClick(Sender: TObject);
begin
  ServerSocket1.Port := edtPort.Value;
  ServerSocket1.Active := True;
  memConsole.Lines.Add('Aplicação iniciada na porta: ' + ServerSocket1.Port.ToString);
end;

procedure TfrmServer.btnStopClick(Sender: TObject);
begin
  ServerSocket1.Active := False;
  memConsole.Lines.Add('Aplicação paralisada!');
end;

procedure TfrmServer.edtMessageKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if Key = VK_RETURN then
    SendMessage();
end;

procedure TfrmServer.ServerSocket1ClientConnect(Sender: TObject;
  Socket: TCustomWinSocket);
begin
  memConsole.Lines.Add('Socket conectado: ' + Socket.RemotePort.ToString + ':' + Socket.RemoteAddress);
end;

procedure TfrmServer.ServerSocket1ClientDisconnect(Sender: TObject;
  Socket: TCustomWinSocket);
begin
  memConsole.Lines.Add('Socket descsonectado: ' + Socket.RemotePort.ToString + ':' + Socket.RemoteAddress);
end;

procedure TfrmServer.ServerSocket1ClientRead(Sender: TObject;
  Socket: TCustomWinSocket);
var
  I: Integer;
  msg: String;
begin
  msg := Socket.ReceiveText;
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

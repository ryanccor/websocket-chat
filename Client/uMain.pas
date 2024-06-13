unit uMain;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls, Vcl.StdCtrls,
  Vcl.Samples.Spin, System.Win.ScktComp, Vcl.ComCtrls;

type
  TfrmClient = class(TForm)
    pnlMessages: TPanel;
    pnlOptions: TPanel;
    edtPort: TSpinEdit;
    btnStart: TButton;
    edtHost: TEdit;
    btnStop: TButton;
    btnSend: TButton;
    memConsole: TMemo;
    ClientSocket1: TClientSocket;
    edtMessage: TRichEdit;
    edtUsername: TEdit;
    procedure btnStartClick(Sender: TObject);
    procedure btnStopClick(Sender: TObject);
    procedure btnSendClick(Sender: TObject);
    procedure ClientSocket1Connect(Sender: TObject; Socket: TCustomWinSocket);
    procedure ClientSocket1Disconnect(Sender: TObject;
      Socket: TCustomWinSocket);
    procedure ClientSocket1Read(Sender: TObject; Socket: TCustomWinSocket);
    procedure edtMessageKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
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

procedure TfrmClient.btnStartClick(Sender: TObject);
begin
  ClientSocket1.Address := edtHost.Text;
  ClientSocket1.Port := edtPort.Value;
  ClientSocket1.Active := True;
end;

procedure TfrmClient.btnStopClick(Sender: TObject);
begin
  ClientSocket1.Active := False;
end;

procedure TfrmClient.ClientSocket1Connect(Sender: TObject;
  Socket: TCustomWinSocket);
begin
  memConsole.Lines.Add('Conectado no servidor: ' + Socket.RemotePort.ToString + ':' + Socket.RemoteAddress);
end;

procedure TfrmClient.ClientSocket1Disconnect(Sender: TObject;
  Socket: TCustomWinSocket);
begin
  memConsole.Lines.Add('Desconectado do servidor: ' + Socket.RemotePort.ToString + ':' + Socket.RemoteAddress);
end;

procedure TfrmClient.ClientSocket1Read(Sender: TObject; Socket: TCustomWinSocket);
begin
  memConsole.Lines.Add(Socket.ReceiveText);
end;

procedure TfrmClient.edtMessageKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if Key = VK_RETURN then
    SendMessage();
end;

procedure TfrmClient.SendMessage;
var
  msg: String;
begin
  msg := edtUsername.Text + ':' + edtMessage.Text;
  memConsole.Lines.Add(msg);
  ClientSocket1.Socket.SendText(msg);
  edtMessage.Clear();
end;

end.

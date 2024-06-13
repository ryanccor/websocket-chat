object frmServer: TfrmServer
  Left = 0
  Top = 0
  Caption = 'Server'
  ClientHeight = 442
  ClientWidth = 628
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = 'Segoe UI'
  Font.Style = []
  TextHeight = 15
  object pnlMessages: TPanel
    Left = 0
    Top = 392
    Width = 628
    Height = 50
    Align = alBottom
    BevelOuter = bvNone
    TabOrder = 0
    ExplicitTop = 383
    ExplicitWidth = 622
    object btnSend: TButton
      Left = 553
      Top = 0
      Width = 75
      Height = 50
      Align = alRight
      Caption = 'Send'
      TabOrder = 0
      OnClick = btnSendClick
      ExplicitLeft = 547
    end
    object edtMessage: TEdit
      Left = 0
      Top = 0
      Width = 553
      Height = 50
      Align = alClient
      TabOrder = 1
      ExplicitWidth = 547
      ExplicitHeight = 23
    end
  end
  object pnlOptions: TPanel
    Left = 0
    Top = 0
    Width = 137
    Height = 392
    Align = alLeft
    BevelOuter = bvNone
    TabOrder = 1
    ExplicitHeight = 383
    object edtPort: TSpinEdit
      Left = 6
      Top = 35
      Width = 123
      Height = 24
      MaxValue = 0
      MinValue = 0
      TabOrder = 0
      Value = 0
    end
    object btnStart: TButton
      Left = 6
      Top = 65
      Width = 123
      Height = 25
      Caption = 'Start'
      TabOrder = 1
      OnClick = btnStartClick
    end
    object edtHost: TEdit
      Left = 6
      Top = 6
      Width = 123
      Height = 23
      TabOrder = 2
      Text = '127.0.0.1'
    end
    object btnStop: TButton
      Left = 6
      Top = 96
      Width = 123
      Height = 25
      Caption = 'Stop'
      TabOrder = 3
      OnClick = btnStopClick
    end
  end
  object memConsole: TMemo
    Left = 137
    Top = 0
    Width = 491
    Height = 392
    Align = alClient
    TabOrder = 2
    ExplicitWidth = 485
    ExplicitHeight = 383
  end
  object ClientSocket1: TClientSocket
    Active = False
    ClientType = ctNonBlocking
    Port = 0
    OnConnect = ClientSocket1Connect
    OnDisconnect = ClientSocket1Disconnect
    OnRead = ClientSocket1Read
    Left = 96
    Top = 128
  end
end

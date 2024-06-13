object frmServer: TfrmServer
  Left = 0
  Top = 0
  Caption = 'Server'
  ClientHeight = 424
  ClientWidth = 616
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = 'Segoe UI'
  Font.Style = []
  TextHeight = 15
  object pnlOptions: TPanel
    Left = 0
    Top = 0
    Width = 137
    Height = 366
    Align = alLeft
    BevelOuter = bvNone
    Color = clNavy
    ParentBackground = False
    TabOrder = 0
    object edtPort: TSpinEdit
      Left = 8
      Top = 8
      Width = 123
      Height = 24
      Align = alCustom
      MaxValue = 0
      MinValue = 0
      TabOrder = 0
      Value = 0
    end
    object btnStart: TButton
      Left = 8
      Top = 67
      Width = 123
      Height = 25
      Caption = 'Start'
      TabOrder = 1
      OnClick = btnStartClick
    end
    object btnStop: TButton
      Left = 8
      Top = 100
      Width = 123
      Height = 25
      Caption = 'Stop'
      TabOrder = 2
      OnClick = btnStopClick
    end
    object edtUsername: TEdit
      Left = 10
      Top = 38
      Width = 121
      Height = 23
      TabOrder = 3
      Text = 'Username'
    end
  end
  object pnlConsole: TPanel
    Left = 137
    Top = 0
    Width = 479
    Height = 366
    Align = alClient
    BevelOuter = bvNone
    TabOrder = 1
    object memConsole: TMemo
      Left = 0
      Top = 0
      Width = 479
      Height = 366
      Align = alClient
      TabOrder = 0
    end
  end
  object Panel1: TPanel
    Left = 0
    Top = 366
    Width = 616
    Height = 58
    Align = alBottom
    BevelOuter = bvNone
    Caption = 'Panel1'
    TabOrder = 2
    object btnSend: TButton
      Left = 541
      Top = 0
      Width = 75
      Height = 58
      Align = alRight
      Caption = 'Send'
      TabOrder = 0
      OnClick = btnSendClick
    end
    object edtMessage: TRichEdit
      Left = 0
      Top = 0
      Width = 541
      Height = 58
      Align = alClient
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -12
      Font.Name = 'Segoe UI'
      Font.Style = []
      ParentFont = False
      TabOrder = 1
      OnKeyDown = edtMessageKeyDown
      ExplicitLeft = 120
      ExplicitTop = 6
      ExplicitWidth = 185
      ExplicitHeight = 89
    end
  end
  object ServerSocket1: TServerSocket
    Active = False
    Port = 0
    ServerType = stNonBlocking
    OnClientConnect = ServerSocket1ClientConnect
    OnClientDisconnect = ServerSocket1ClientDisconnect
    OnClientRead = ServerSocket1ClientRead
    Left = 568
    Top = 8
  end
end

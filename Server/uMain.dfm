object frmClient: TfrmClient
  Left = 0
  Top = 0
  Caption = 'Client'
  ClientHeight = 433
  ClientWidth = 622
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
    Height = 375
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
      Top = 39
      Width = 123
      Height = 25
      Caption = 'Start'
      TabOrder = 1
      OnClick = btnStartClick
    end
    object btnStop: TButton
      Left = 8
      Top = 72
      Width = 123
      Height = 25
      Caption = 'Stop'
      TabOrder = 2
      OnClick = btnStopClick
    end
  end
  object pnlConsole: TPanel
    Left = 137
    Top = 0
    Width = 485
    Height = 375
    Align = alClient
    BevelOuter = bvNone
    TabOrder = 1
    object memConsole: TMemo
      Left = 0
      Top = 0
      Width = 491
      Height = 384
      Align = alClient
      TabOrder = 0
      ExplicitWidth = 485
      ExplicitHeight = 375
    end
  end
  object Panel1: TPanel
    Left = 0
    Top = 375
    Width = 622
    Height = 58
    Align = alBottom
    BevelOuter = bvNone
    Caption = 'Panel1'
    TabOrder = 2
    object edtMessage: TEdit
      Left = 0
      Top = 0
      Width = 553
      Height = 58
      Align = alClient
      TabOrder = 0
      ExplicitWidth = 547
      ExplicitHeight = 23
    end
    object btnSend: TButton
      Left = 553
      Top = 0
      Width = 75
      Height = 58
      Align = alRight
      Caption = 'Send'
      TabOrder = 1
      OnClick = btnSendClick
      ExplicitLeft = 547
    end
  end
  object ServerSocket1: TServerSocket
    Active = False
    Port = 0
    ServerType = stNonBlocking
    OnClientConnect = ServerSocket1ClientConnect
    OnClientDisconnect = ServerSocket1ClientDisconnect
    OnClientRead = ServerSocket1ClientRead
    Left = 56
    Top = 104
  end
end

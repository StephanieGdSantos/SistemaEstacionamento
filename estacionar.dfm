object Form2: TForm2
  Left = 0
  Top = 0
  Caption = 'Estacionar'
  ClientHeight = 292
  ClientWidth = 340
  Color = clBtnFace
  Constraints.MaxHeight = 331
  Constraints.MaxWidth = 356
  Constraints.MinHeight = 331
  Constraints.MinWidth = 356
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = 'Segoe UI'
  Font.Style = []
  Position = poMainFormCenter
  OnClose = FormClose
  OnShow = FormShow
  TextHeight = 15
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 340
    Height = 292
    Align = alClient
    Padding.Left = 30
    Padding.Top = 30
    Padding.Right = 30
    Padding.Bottom = 30
    TabOrder = 0
    object btnImprimir: TSpeedButton
      Left = 119
      Top = 224
      Width = 106
      Height = 33
      Caption = 'Imprimir'
      Transparent = False
      OnClick = btnImprimirClick
    end
    object Panel2: TPanel
      Left = 31
      Top = 31
      Width = 282
      Height = 50
      Align = alTop
      BevelOuter = bvNone
      BorderStyle = bsSingle
      Ctl3D = False
      ParentCtl3D = False
      TabOrder = 0
      ExplicitWidth = 278
      object Label1: TLabel
        Left = 123
        Top = 5
        Width = 28
        Height = 15
        Alignment = taCenter
        Caption = 'Local'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'Lato'
        Font.Style = []
        ParentFont = False
      end
      object lblVaga: TLabel
        Left = 124
        Top = 18
        Width = 28
        Height = 25
        Alignment = taCenter
        Caption = 'A1'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -21
        Font.Name = 'Lato'
        Font.Style = [fsBold]
        ParentFont = False
      end
    end
    object Panel3: TPanel
      Left = 31
      Top = 81
      Width = 282
      Height = 30
      Align = alTop
      BevelOuter = bvNone
      TabOrder = 1
      ExplicitWidth = 278
      object pnlHorario: TPanel
        Left = 0
        Top = 0
        Width = 141
        Height = 30
        Align = alLeft
        BevelOuter = bvNone
        BorderStyle = bsSingle
        Caption = 'Hor'#225'rio:'
        Ctl3D = False
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'Lato'
        Font.Style = []
        ParentCtl3D = False
        ParentFont = False
        TabOrder = 0
      end
      object pnlTaxa: TPanel
        Left = 141
        Top = 0
        Width = 141
        Height = 30
        Align = alRight
        BevelOuter = bvNone
        BorderStyle = bsSingle
        Caption = 'Taxa/h: '
        Ctl3D = False
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'Lato'
        Font.Style = []
        ParentCtl3D = False
        ParentFont = False
        TabOrder = 1
        ExplicitLeft = 137
      end
    end
    object Panel4: TPanel
      Left = 31
      Top = 112
      Width = 282
      Height = 106
      BevelOuter = bvNone
      Padding.Top = 35
      Padding.Bottom = 12
      TabOrder = 2
      object Label3: TLabel
        Left = 0
        Top = 35
        Width = 51
        Height = 24
        Align = alTop
        Alignment = taCenter
        Caption = 'Token'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -20
        Font.Name = 'Lato'
        Font.Style = []
        ParentFont = False
      end
      object lblToken: TLabel
        Left = 0
        Top = 61
        Width = 125
        Height = 33
        Align = alBottom
        Alignment = taCenter
        Caption = 'A5F4G5R'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -27
        Font.Name = 'Lato'
        Font.Style = [fsBold]
        ParentFont = False
        Layout = tlCenter
      end
    end
  end
  object FDConnection1: TFDConnection
    Params.Strings = (
      'Database=estacionamento'
      'User_Name=postgres'
      'Password=BomBom10'
      'Server=localhost'
      'DriverID=PG')
    Connected = True
    Left = 16
    Top = 120
  end
  object FDQuery1: TFDQuery
    Connection = FDConnection1
    Left = 55
    Top = 120
  end
  object FDPhysPgDriverLink1: TFDPhysPgDriverLink
    Left = 95
    Top = 120
  end
end

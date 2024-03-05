object Form3: TForm3
  Left = 0
  Top = 0
  Caption = 'Form3'
  ClientHeight = 293
  ClientWidth = 344
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = 'Segoe UI'
  Font.Style = []
  Position = poMainFormCenter
  OnShow = FormShow
  TextHeight = 15
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 344
    Height = 293
    Align = alClient
    Padding.Left = 30
    Padding.Top = 30
    Padding.Right = 30
    Padding.Bottom = 30
    TabOrder = 0
    ExplicitWidth = 340
    ExplicitHeight = 292
    object Label5: TLabel
      Left = 122
      Top = 163
      Width = 105
      Height = 18
      Alignment = taCenter
      Caption = 'Insira seu token'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -15
      Font.Name = 'Lato'
      Font.Style = []
      ParentFont = False
    end
    object btnPagar: TSpeedButton
      Left = 119
      Top = 232
      Width = 106
      Height = 39
      Caption = 'Pagar'
      OnClick = btnPagarClick
    end
    object Panel2: TPanel
      Left = 31
      Top = 81
      Width = 282
      Height = 30
      Align = alTop
      BevelOuter = bvNone
      BorderStyle = bsSingle
      Ctl3D = False
      ParentCtl3D = False
      TabOrder = 0
      ExplicitWidth = 278
      object pnlHorario: TPanel
        Left = 0
        Top = 0
        Width = 141
        Height = 28
        Align = alLeft
        BevelOuter = bvNone
        BorderStyle = bsSingle
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
        Left = 139
        Top = 0
        Width = 141
        Height = 28
        Align = alRight
        BevelOuter = bvNone
        BorderStyle = bsSingle
        Ctl3D = False
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'Lato'
        Font.Style = []
        ParentCtl3D = False
        ParentFont = False
        TabOrder = 1
        ExplicitLeft = 135
      end
    end
    object Panel3: TPanel
      Left = 31
      Top = 31
      Width = 282
      Height = 50
      Align = alTop
      BevelOuter = bvNone
      BorderStyle = bsSingle
      Ctl3D = False
      ParentCtl3D = False
      TabOrder = 1
      ExplicitWidth = 278
      object Label1: TLabel
        Left = 126
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
        Left = 126
        Top = 18
        Width = 28
        Height = 25
        Alignment = taCenter
        Caption = 'A1'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -21
        Font.Name = 'Lato'
        Font.Style = [fsBold]
        ParentFont = False
      end
    end
    object pnlTotal: TPanel
      Left = 31
      Top = 111
      Width = 282
      Height = 30
      Align = alTop
      Alignment = taLeftJustify
      BevelOuter = bvNone
      BorderStyle = bsSingle
      Ctl3D = False
      Padding.Left = 10
      Padding.Top = 5
      ParentCtl3D = False
      TabOrder = 2
      ExplicitWidth = 278
      object lblValorFinal: TLabel
        Left = 96
        Top = 5
        Width = 7
        Height = 23
        Align = alLeft
        Alignment = taCenter
        Caption = '0'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'Lato'
        Font.Style = []
        ParentFont = False
        ExplicitLeft = 106
        ExplicitHeight = 15
      end
      object Label4: TLabel
        Left = 10
        Top = 5
        Width = 86
        Height = 23
        Align = alLeft
        Alignment = taCenter
        Caption = 'Total a pagar: R$'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'Lato'
        Font.Style = []
        ParentFont = False
        ExplicitLeft = 20
        ExplicitHeight = 15
      end
    end
    object edtToken: TEdit
      Left = 106
      Top = 187
      Width = 132
      Height = 24
      Hint = 'Insira aqui'
      Alignment = taCenter
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Lato'
      Font.Style = []
      ParentFont = False
      TabOrder = 3
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
  end
  object FDQuery1: TFDQuery
    Connection = FDConnection1
    Left = 48
  end
  object FDPhysPgDriverLink1: TFDPhysPgDriverLink
    Left = 80
  end
end

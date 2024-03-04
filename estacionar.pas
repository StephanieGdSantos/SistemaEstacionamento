unit estacionar;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls, Vcl.StdCtrls, Vcl.Buttons,
  FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Error, FireDAC.UI.Intf,
  FireDAC.Phys.Intf, FireDAC.Stan.Def, FireDAC.Stan.Pool, FireDAC.Stan.Async,
  FireDAC.Phys, FireDAC.VCLUI.Wait, FireDAC.Stan.Param, FireDAC.DatS,
  FireDAC.DApt.Intf, FireDAC.DApt, Data.DB, FireDAC.Comp.DataSet,
  FireDAC.Comp.Client, FireDAC.Phys.PG, FireDAC.Phys.PGDef,
  formPrincipal;

type
  TForm2 = class(TForm)
    Panel1: TPanel;
    Panel2: TPanel;
    pnlHorario: TPanel;
    pnlTaxa: TPanel;
    Label1: TLabel;
    lblVaga: TLabel;
    Label3: TLabel;
    Panel3: TPanel;
    lblToken: TLabel;
    btnImprimir: TSpeedButton;
    Panel4: TPanel;
    FDConnection1: TFDConnection;
    FDQuery1: TFDQuery;
    FDPhysPgDriverLink1: TFDPhysPgDriverLink;
    procedure FormShow(Sender: TObject);
    procedure btnImprimirClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
  public
  function GerarToken(const Tamanho: Integer): string;
    { Public declarations }
  end;

var
  Form2: TForm2;

implementation

{$R *.dfm}

procedure TForm2.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  ModalResult := mrOk;
end;

procedure TForm2.FormShow(Sender: TObject);
var
  Taxa: Integer;
begin
  Taxa := 15;
  lblToken.Caption := GerarToken(6);
  pnlTaxa.Caption := 'Taxa: R$' + Taxa.ToString;
  pnlHorario.Caption := DateTimeToStr(Now);
end;

function TForm2.GerarToken(const Tamanho: Integer): string;
const
  CharSet = 'abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789';
var
  i: Integer;
  Resultado: String;
begin
  Resultado := '';
  Randomize;
  for i := 1 to Tamanho do Resultado := Resultado + CharSet[Random(62)];

  Result := Resultado;
end;

procedure TForm2.btnImprimirClick(Sender: TObject);
var
  NomeVaga,
  Token: String;
  Data: TDateTime;
begin
  NomeVaga := lblVaga.Caption;
  Token := lblToken.Caption;
  Data := StrToDateTime(pnlHorario.Caption);

  try
    FDConnection1.Connected := True;
    FDQuery1.Connection := FDConnection1;
    FDQuery1.SQL.Text := 'UPDATE vaga SET hora_estacionamento=:hora, '+
    'token=:token, disponibilidade=:disponibilidade WHERE nome=:nome';
    FDQuery1.ParamByName('hora').AsDateTime := Data;
    FDQuery1.ParamByName('token').AsString := Token;
    FDQuery1.ParamByName('disponibilidade').AsString := 'N�o';
    FDQuery1.ParamByName('nome').AsString := NomeVaga;
    FDQuery1.ExecSQL;
  finally
    FDConnection1.Free;
    FDQuery1.Free;
  end;
end;

end.

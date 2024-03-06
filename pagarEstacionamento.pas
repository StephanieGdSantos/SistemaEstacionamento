unit pagarEstacionamento;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls, Vcl.StdCtrls, Vcl.Buttons,
  FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Error, FireDAC.UI.Intf,
  FireDAC.Phys.Intf, FireDAC.Stan.Def, FireDAC.Stan.Pool, FireDAC.Stan.Async,
  FireDAC.Phys, FireDAC.VCLUI.Wait, FireDAC.Stan.Param, FireDAC.DatS,
  FireDAC.DApt.Intf, FireDAC.DApt, Data.DB, FireDAC.Comp.DataSet,
  FireDAC.Comp.Client, FireDAC.Phys.PGDef, FireDAC.Phys.PG;

type
  TForm3 = class(TForm)
    Panel1: TPanel;
    Panel2: TPanel;
    Panel3: TPanel;
    pnlHorario: TPanel;
    pnlTaxa: TPanel;
    pnlTotal: TPanel;
    Label1: TLabel;
    lblVaga: TLabel;
    lblValorFinal: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    edtToken: TEdit;
    btnPagar: TSpeedButton;
    FDConnection1: TFDConnection;
    FDQuery1: TFDQuery;
    FDPhysPgDriverLink1: TFDPhysPgDriverLink;
    procedure btnPagarClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
  public
    procedure ChecarToken(Vaga, Token: String);
    function CalcularValorFinal(TempoInicial: TDateTime; Taxa: Double): String;
    { Public declarations }
  end;

var
  Form3: TForm3;

implementation

{$R *.dfm}

function TForm3.CalcularValorFinal(TempoInicial: TDateTime; Taxa: Double): String;
var
  TempoTotal,
  HorasTotais: TTime;
  Horas, Minutos, Segundos, MSegundos: Word;
  PrecoTotal: Double;
begin
  TempoTotal := TempoInicial-Now;
  DecodeTime(TempoTotal, Horas, Minutos, Segundos, MSegundos);
  HorasTotais := Horas + (Minutos / 60) + (Segundos / 3600);
  PrecoTotal := HorasTotais*Taxa;
  Result := FormatFloat('#0.00', PrecoTotal);
end;

procedure TForm3.ChecarToken(Vaga, Token: String);
var
  TokenCorreto: String;
begin
  try
    FDConnection1.Connected := True;
    FDQuery1.SQL.Text := 'SELECT token FROM vaga WHERE nome=:nome';
    FDQuery1.ParamByName('nome').AsString := Vaga;
    FDQuery1.Open;

    if not FDQuery1.IsEmpty then
    begin
      TokenCorreto := FDQuery1.FieldByName('token').AsString;

      if Token = TokenCorreto then
      begin
        FDQuery1.Close;
        FDQuery1.SQL.Text := 'UPDATE vaga SET hora_estacionamento=null, token=null, ' +
          'disponibilidade=:disponibilidade WHERE nome=:nome';
        FDQuery1.ParamByName('nome').AsString := Vaga;
        FDQuery1.ParamByName('disponibilidade').AsString := 'Sim';
        FDQuery1.ExecSQL;
        Close;
      end
      else
      begin
        showMessage('Token inv�lido.');
        edtToken.Clear;
      end;
    end
    else
    begin
      showMessage('Registro n�o encontrado para a vaga: ' + Vaga);
    end;
  finally

  end;
end;

procedure TForm3.FormShow(Sender: TObject);
var
  Taxa: Double;
  Nome: String;
  horaEstacionada: TDateTime;
begin
  Nome := lblVaga.Caption;
  Taxa := 15;

  try
    FDQuery1.SQL.Text := 'SELECT hora_estacionamento FROM vaga WHERE nome=:nome;';
    FDQuery1.ParamByName('nome').AsString := Nome;
    FDQuery1.Open;

    if not FDQuery1.IsEmpty then
    begin
      horaEstacionada := FDQuery1.FieldByName('hora_estacionamento').AsDateTime;

      pnlHorario.Caption := DateTimeToStr(horaEstacionada);
      pnlTaxa.Caption := 'Taxa: ' + Taxa.ToString;
      lblValorFinal.Caption := CalcularValorFinal(horaEstacionada, Taxa);
    end
    else
    begin
      showMessage('Registro n�o encontrado para a vaga: ' + Nome);
    end;
  finally

  end;
end;

procedure TForm3.btnPagarClick(Sender: TObject);
begin
  ChecarToken(lblVaga.Caption, edtToken.Text);
end;

end.

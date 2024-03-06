unit formPrincipal;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.Imaging.pngimage, Vcl.ExtCtrls,
  Vcl.StdCtrls, FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Error, FireDAC.UI.Intf, FireDAC.Phys.Intf, FireDAC.Stan.Def,
  FireDAC.Stan.Pool, FireDAC.Stan.Async, FireDAC.Phys, FireDAC.Phys.PG,
  FireDAC.Phys.PGDef, FireDAC.VCLUI.Wait, FireDAC.Stan.Param, FireDAC.DatS,
  FireDAC.DApt.Intf, FireDAC.DApt, Data.DB, FireDAC.Comp.DataSet,
  FireDAC.Comp.Client, Generics.Collections, pagarEstacionamento;

type
  TVaga = record
    nome: String;
    disponibilidade: Boolean;
  end;

  TForm1 = class(TForm)
    Estacionamento: TImage;
    Label1: TLabel;
    legendaVerde: TImage;
    legendaVermelha: TImage;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    A1: TImage;
    A2: TImage;
    A3: TImage;
    A4: TImage;
    B1: TImage;
    B2: TImage;
    B3: TImage;
    B4: TImage;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    Label9: TLabel;
    Label10: TLabel;
    Label11: TLabel;
    Label12: TLabel;
    FDConnection1: TFDConnection;
    FDQuery1: TFDQuery;
    FDPhysPgDriverLink1: TFDPhysPgDriverLink;
    procedure AbrirTicket(Objeto: TObject);
    procedure FormShow(Sender: TObject);
  private
    FVagas: TList<TVaga>;
    { Private declarations }
  public
    procedure MudarCor();
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation
Uses
  estacionar;

{$R *.dfm}

procedure TForm1.AbrirTicket(Objeto: TObject);
var
  vaga: String;
  FrmEstacionar: TForm2;
  FrmPagar: TForm3;
  RespModal,
  RespPgto: Integer;
  j: Integer;
begin
  vaga := TImage(Objeto).Name;

  FrmEstacionar := TForm2.Create(Application);
  FrmEstacionar.lblVaga.Caption := vaga;

  FrmPagar := TForm3.Create(Application);
  FrmPagar.lblVaga.Caption := vaga;

  try

    for j := 0 to 7 do
    begin
      if FVagas[j].nome = vaga then
      begin
        if FVagas[j].disponibilidade = True then
        begin
        begin
          RespModal := FrmEstacionar.ShowModal();

          if RespModal = mrOK then MudarCor();
        end;
      end
      else if FVagas[j].disponibilidade = False then
      begin
        RespPgto := FrmPagar.ShowModal();
        showMessage(RespPgto.ToString);

        if RespPgto = 2 then MudarCor();

      end;
        Break;
      end;
    end;

  finally
    FrmEstacionar.Free;
    FrmPagar.Free;
  end;
end;

procedure TForm1.FormShow(Sender: TObject);
begin
  FVagas := Tlist<TVaga>.Create;
  MudarCor();
end;

procedure TForm1.MudarCor();
var
  Imagens: array[0..7] of TImage;
  i: Integer;
  DispVaga,
  NomeVaga: String;
  Vaga: TVaga;
  k: Integer;
begin
  Imagens[0] := A1;
  Imagens[1] := A2;
  Imagens[2] := A3;
  Imagens[3] := A4;
  Imagens[4] := B1;
  Imagens[5] := B2;
  Imagens[6] := B3;
  Imagens[7] := B4;

  FDConnection1.Connected := True;
  FDQuery1.Connection := FDConnection1;
  FDQuery1.SQL.Text := 'SELECT nome, disponibilidade FROM vaga ORDER BY nome';
  FDQuery1.Open;

  FDQuery1.First;
  i := 0;
  FVagas.Clear;
  while not FDQuery1.Eof do
  begin
    DispVaga := FDQuery1.FieldByName('disponibilidade').AsString;
    NomeVaga := FDQuery1.FieldByName('nome').AsString;

    Vaga.nome := NomeVaga;

    if DispVaga = 'N�o' then
    begin
      Vaga.disponibilidade := False;
        if Imagens[i].Name = NomeVaga then
          Imagens[i].Picture.LoadFromFile('../../BtnVermelho.png');
    end
    else
    begin
      Vaga.disponibilidade := True;
      Imagens[i].Picture.LoadFromFile('../../disponivel.png');
    end;

    FVagas.Add(Vaga);

    FDQuery1.Next;
    i := i+1;
  end;

end;

end.

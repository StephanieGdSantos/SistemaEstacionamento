program Gerenciador_Estacionamento;

uses
  Vcl.Forms,
  formPrincipal in 'formPrincipal.pas' {Form1},
  estacionar in 'estacionar.pas' {Form2},
  pagarEstacionamento in 'pagarEstacionamento.pas' {Form3};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TForm1, Form1);
  Application.CreateForm(TForm2, Form2);
  Application.CreateForm(TForm3, Form3);
  Application.Run;
end.

unit uAgenda;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.ExtCtrls, Vcl.Mask;

type
  TfrmAgenda = class(TForm)
    edNome: TEdit;
    meData: TMaskEdit;
    rgSexo: TRadioGroup;
    meTel_Comercial: TMaskEdit;
    lbComercial: TLabel;
    lbData: TLabel;
    lbNome: TLabel;
    meTel_Residencial: TMaskEdit;
    lbResidencial: TLabel;
    edEndereco: TEdit;
    lbEndereco: TLabel;
    edBairro: TEdit;
    lbBairro: TLabel;
    cbEstadoCivil: TComboBox;
    Label1: TLabel;
    meCEP: TMaskEdit;
    btSalvar: TButton;
    btDelete: TButton;
    btLimpar: TButton;
    btBuscar: TButton;
    mmContato: TMemo;
    btLimpar2: TButton;
    btAtualizar: TButton;
    btSair: TButton;
    btCancel: TButton;
    btAtualizar2: TButton;
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btSalvarClick(Sender: TObject);
    function VerificaNome(Nome: String):Integer;
    procedure btDeleteClick(Sender: TObject);
    procedure btLimparClick(Sender: TObject);
    procedure btBuscarClick(Sender: TObject);
    procedure btLimpar2Click(Sender: TObject);
    procedure btAtualizarClick(Sender: TObject);
    function VerificaSexo(sexo: char): integer;
    function VerificaeEC(EstadoCivil: char): integer;
    procedure btCancelClick(Sender: TObject);
    procedure btAtualizar2Click(Sender: TObject);
    procedure mostrarmemo(n :integer);
    procedure btSairClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

  TYPE
			contato = record
			Nome: string[60];
			Idade: string[10];
			Sexo: char;
			Tel_Comercial: string[20];
			Tel_Residencial: string[15];
			Endereco: string[40];
			Bairro: string[40];
      Estado_Civil : char;
			Cep: string[9];
      StatusReg : Boolean;
		END;

var
  frmAgenda: TfrmAgenda;
  Agenda : ARRAY[0..100] of contato;
  Arquivo: file of contato;
  Posicao2: Integer;

implementation

{$R *.dfm}

//Função que retorna a posicão do contato
function Posicao(nome: string): integer;
var i : Integer;
begin
    Posicao := -1;
   for i := 0 to 100 do
  begin
    if Agenda[i].Nome = nome then
     Posicao := i;
  end;
end;


//Função que transforma o Char(LETRA) em integer para retornar o estado cívil do contato que será atualizado
function TfrmAgenda.VerificaeEC(EstadoCivil: char): integer;
begin
  case EstadoCivil of

    'S':
        Result := 0;
    'C':
        Result := 1;
    'D':
        Result := 2;
    'V':
        Result := 3;


  End;
end;


//Função que verifica a existência de um nome no arquivo
function TfrmAgenda.VerificaNome(Nome: String): Integer;
var
  i: Integer;
begin
  for i := 0 to 100 do

  begin

    if Agenda[i].StatusReg = True then
    begin

      if Agenda[i].Nome = Nome then
      begin

        Result := 1;
        exit;

      end;

    end;

  end;
  Result := 0;
end;

//Função que recebe um char (M ou F) e retornar 0 ou 1
function TfrmAgenda.VerificaSexo(sexo: char): integer;
begin

  case sexo of

    'M':
        Result := 1;
    'F':
        Result := 0;

  End;

end;


//Procedimento que atualizará o contato com seus novos dados
procedure TfrmAgenda.btAtualizar2Click(Sender: TObject);

begin
    mmContato.Clear;
    //Atualiza Sexo
    if (rgSexo.ItemIndex = 0) then
      Agenda[Posicao2].Sexo := 'F'
    else if (rgSexo.ItemIndex = 1) then
      Agenda[Posicao2].Sexo := 'M'
    else
    begin
      MessageDlg('Selecione o sexo, por favor', mtError, [mbRetry], 0);
      exit
    end;

    //Atualiza data de nascimento
    if ((meData.Text <> '') and (Length(meData.Text) <= 10)) then
      Agenda[Posicao2].Idade := Uppercase(meData.Text)
    else
    begin
      MessageDlg('Digite sua data de nascimento novamente', mtError, [mbRetry], 0);
      meData.SetFocus;
      exit
    end;

    //Atualiza celular
    if ((meTel_Comercial.Text <> '') and (Length(meTel_Comercial.Text) <= 20)) then
      Agenda[Posicao2].Tel_Comercial := (meTel_Comercial.Text)
    else
    begin
      MessageDlg('Digite seu celular novamente', mtError, [mbRetry], 0);
      meTel_Comercial.SetFocus;
      exit
    end;

    //Atualiza telefone residêncial
    if ((meTel_Residencial.Text <> '') and (Length(meTel_Residencial.Text) <= 15)) then
      Agenda[Posicao2].Tel_Residencial := (meTel_Residencial.Text)
    else
    begin
      MessageDlg('Digite seu telefone comercial novamente', mtError, [mbRetry], 0);
      meTel_Residencial.SetFocus;
      exit
    end;

    //Atualiza endereço
    if ((edEndereco.Text <> '') and (Length(edEndereco.Text) <= 40)) then
      Agenda[Posicao2].Endereco := UpperCase(edEndereco.Text)
    else
    begin
      MessageDlg('Digite novamente seu endereço', mtError, [mbRetry], 0);
      edEndereco.SetFocus;
      exit
    end;

    //Atualiza bairro
    if ((edBairro.Text <> '') and (Length(edBairro.Text) <= 40)) then
      Agenda[Posicao2].Bairro := UpperCase(edBairro.Text)
    else
    begin
      MessageDlg('Digite novamente seu bairro', mtError, [mbRetry], 0);
      edBairro.SetFocus;
      exit
    end;

    //Atualiza estado cívil
    if (cbEstadoCivil.ItemIndex = 0) then
      Agenda[Posicao2].Estado_Civil := 'S'
    else if (cbEstadoCivil.ItemIndex = 1) then
      Agenda[Posicao2].Estado_Civil := 'C'
    else if (cbEstadoCivil.ItemIndex = 2) then
      Agenda[Posicao2].Estado_Civil := 'D'
    else if (cbEstadoCivil.ItemIndex = 3) then
      Agenda[Posicao2].Estado_Civil := 'V'
    else
    begin
      MessageDlg('Selecione seu Estado Civil, por favor', mtError, [mbRetry], 0);
      exit
    end;

    //Atualizar CEP
    if ((meCEP.Text <> '') and (Length(meCEP.Text) <= 9)) then
      Agenda[Posicao2].Cep := UpperCase(meCEP.Text)
    else
    begin
      MessageDlg('Digite novamente seu CEP', mtError, [mbRetry], 0);
      meCEP.SetFocus;
      exit
    end;

    //Verificar existencia de um nome
    if (VerificaNome(UpperCase(edNome.Text)) = 0) then
      Agenda[Posicao2].Nome := Uppercase(edNome.Text)
    else
    begin
      MessageDlg('Este nome já está cadastrado', mtError, [mbRetry], 0);
      edNome.SetFocus;
      Exit;
    end;

    //Verificar nome
    if ((edNome.Text <> '') and (Length(edNome.Text) <= 60)) then
      Agenda[Posicao2].Nome := UPPERCASE(edNome.Text)
    else
    begin
      MessageDlg('Digite seu nome novamente', mtError, [mbRetry], 0);
      edNome.SetFocus;
      Exit;
    end;







      MessageDlg('Contato atualizado com sucesso', mtConfirmation, [mbOK], 0);
       mostrarmemo(Posicao2);  //Procedimento q mostrará o contato atualizado no memo


       //Ativação dos botões
       btBuscar.Enabled := True;
       btSalvar.Enabled := TRUE;
       btLimpar2.Enabled := TRUE;
       btBuscar.Enabled := TRUE;
       btLimpar.Enabled := TRUE;
       btDelete.Enabled := TRUE;


        //Limpa os Edit's
        edNome.Text := '';
        edEndereco.Text := '';
        edBairro.Text := '';
        meTel_Comercial.Text := '';
        meTel_Residencial.Text := '';
        meCEP.Text := '';
        cbEstadoCivil.ItemIndex := -1;
        rgSexo.ItemIndex := -1;
        meData.Text := '';

end;


//Procedimento que buscará o contato e após mostrará as informações do mesmo para a atualização
procedure TfrmAgenda.btAtualizarClick(Sender: TObject);
var nome : String;
    i : Integer;
    flag : boolean;
begin
  mmContato.Clear; //Limpa o memo
  if not(InputQuery('Digite o nome do contato que deseja atualizar' , 'Nome: ', nome)) then  //Busca o contato que deseja atualizar
    Exit;

  if nome = '' then
    begin
      MessageDlg('Digite um nome novamente!', mtError, [mbRetry], 0);
      Exit;
    end;

  btSalvar.Enabled := False;
  btLimpar2.Enabled := False;
  btBuscar.Enabled := False;
  btLimpar.Enabled := False;
  btDelete.Enabled := False;


  //Resgata os dados do contato da respectiva posição
  for i := 0 to 100 do
  begin
    if UpperCase(nome) = Agenda[i].Nome then
    begin
      edNome.Text := Agenda[i].Nome;
      meData.Text := Agenda[i].Idade;
      rgSexo.ItemIndex := VerificaSexo(Agenda[i].Sexo);
      meTel_Comercial.Text := Agenda[i].Tel_Comercial;
      meTel_Residencial.Text := Agenda[i].Tel_Residencial;
      edEndereco.Text := Agenda[i].Endereco;
      edBairro.Text   := Agenda[i].Bairro;
      cbEstadoCivil.ItemIndex := VerificaeEC(Agenda[i].Estado_Civil);
      meCEP.Text := Agenda[i].Cep;
    end;
  end;
    flag := TRUE;
   for i := 0 to 100 do
  begin
       if UpperCase(nome) = Agenda[i].Nome then
       begin
            Posicao2 := Posicao(UpperCase(nome)); //Posição do contato é colocada em uma variável global
            mostrarmemo(Posicao2);
            flag := FALSE;
       end;
  end;
  if(flag) then
  begin
    mmContato.Clear;
    MessageDlg('Nome não encontrado!', mtError, [mbRetry], 0);
    btSalvar.Enabled := TRUE;
    btLimpar2.Enabled := TRUE;
    btBuscar.Enabled := TRUE;
    btLimpar.Enabled := TRUE;
    btDelete.Enabled := TRUE;
    Exit;
  end;


  btAtualizar2.Enabled := True;
  btCancel.Enabled := True
end;





//Procedimento que busca um contato pelo Nome
procedure TfrmAgenda.btBuscarClick(Sender: TObject);
var i : integer;
    nome : string;
begin
  mmContato.Clear;
   if not(InputQuery('Digite o nome do contato que deseja buscar', 'Nome: ', nome)) then //Busca o contato
    Exit;

  if nome = '' then
    begin
      MessageDlg('Digite um nome novamente!', mtError, [mbRetry], 0);
      Exit;
    end;


  //Mostrará os dados do contato no memo
  for i := 0 to 100 do
    begin
      if UpperCase(nome) = Agenda[i].Nome then
        begin
          mmContato.Lines.Add('Nome: ' + Agenda[i].Nome);
          mmContato.Lines.Add('Data de nascimeto: ' + Agenda[i].Idade);
          mmContato.Lines.Add('Sexo: ' + Agenda[i].Sexo);
          mmContato.Lines.Add('Celular: ' + Agenda[i].Tel_Comercial);
          mmContato.Lines.Add('Telefone Residencial: ' + Agenda[i].Tel_Residencial);
          mmContato.Lines.Add('Endereço: ' + Agenda[i].Endereco);
          mmContato.Lines.Add('Bairro: ' + Agenda[i].Bairro);
          mmContato.Lines.Add('Estado Civil: ' + Agenda[i].Estado_Civil);
          mmContato.Lines.Add('CEP: ' + Agenda[i].Cep);
          Exit;
        end;
    end;
end;


//Procedimento que cancelará a atualização
procedure TfrmAgenda.btCancelClick(Sender: TObject);
begin
   edNome.Text := '';
   meData.Text := '';
   rgSexo.ItemIndex := -1;
   meTel_Comercial.Text := '';
   meTel_Residencial.Text := '';
   edEndereco.Text := '';
   edBairro.Text   := '';
   cbEstadoCivil.ItemIndex := -1;
   meCEP.Text := '';
  btSalvar.Enabled := True;
  btLimpar2.Enabled := True;
  btBuscar.Enabled := True;
  btLimpar.Enabled := True;
  btDelete.Enabled := True;
end;


//Procedimento que deletará o contato
procedure TfrmAgenda.btDeleteClick(Sender: TObject);
var nome : string;
    i    : integer;
begin


  //Busca o nome de um contato que deseja ser deletado
  if not(InputQuery('Digite o nome do contato que deseja deletar', 'Nome: ', nome)) then
    Exit;


  //Verifica se o contato possui caracteres válidos
  if nome = '' then
  begin
    MessageDlg('Digite um nome novamente!', mtError, [mbRetry], 0);
    Exit;
  end;


  //Deleta o contato
  for i := 0 to 100 do
  begin
    if UpperCase(nome) = Agenda[i].Nome then
    begin
      Agenda[i].Nome := '';
      Agenda[i].StatusReg := false;
      MessageDlg('Contato deletado com sucesso', mtConfirmation, [mbOK], 0);
      mmContato.Clear;
      Exit;
    end;
  end;

  MessageDlg('Contato não encontrado', mtError, [mbRetry], 0);

end;


//Procedimento que fecha o programa
procedure TfrmAgenda.btSairClick(Sender: TObject);
begin
  Close; //Comando para fechar
end;


//Procedimento que salvará um novo contato
procedure TfrmAgenda.btSalvarClick(Sender: TObject);
var i : integer;
begin
  for i := 0 to 100 do
  begin
    //verificar se há registros na posição N
    if Agenda[i].StatusReg = false then
    begin

    //Verificar existencia de um nome
    if (VerificaNome(UpperCase(edNome.Text)) = 0) then
      Agenda[i].Nome := Uppercase(edNome.Text)
    else
    begin
      MessageDlg('Este nome já está cadastrado', mtError, [mbRetry], 0);
      edNome.SetFocus;
      Exit;
    end;

    //Verificar nome
    if ((edNome.Text <> '') and (Length(edNome.Text) <= 60)) then
      Agenda[i].Nome := UPPERCASE(edNome.Text)
    else
    begin
      MessageDlg('Digite seu nome novamente', mtError, [mbRetry], 0);
      edNome.SetFocus;
      Exit;
    end;



    //Verificar data de nascimento
    if ((meData.Text <> '') and (Length(meData.Text) <= 10)) then
      Agenda[i].Idade := Uppercase(meData.Text)
    else
    begin
      MessageDlg('Digite sua data de nascimento novamente', mtError, [mbRetry], 0);
      meData.SetFocus;
      exit
    end;

    //Verificar Sexo
    if (rgSexo.ItemIndex = 0) then
      Agenda[i].Sexo := 'F'
    else if (rgSexo.ItemIndex = 1) then
      Agenda[i].Sexo := 'M'
    else
    begin
      MessageDlg('Selecione o sexo, por favor', mtError, [mbRetry], 0);
      exit
    end;


    //Verificar celular
    if ((meTel_Comercial.Text <> '') and (Length(meTel_Comercial.Text) <= 20)) then
      Agenda[i].Tel_Comercial := (meTel_Comercial.Text)
    else
    begin
      MessageDlg('Digite seu celular novamente', mtError, [mbRetry], 0);
      meTel_Comercial.SetFocus;
      exit
    end;


    //Verificar telefone residêncial
    if ((meTel_Residencial.Text <> '') and (Length(meTel_Residencial.Text) <= 15)) then
      Agenda[i].Tel_Residencial := (meTel_Residencial.Text)
    else
    begin
      MessageDlg('Digite seu telefone comercial novamente', mtError, [mbRetry], 0);
      meTel_Residencial.SetFocus;
      exit
    end;

    //Verificar endereço
    if ((edEndereco.Text <> '') and (Length(edEndereco.Text) <= 40)) then
      Agenda[i].Endereco := UpperCase(edEndereco.Text)
    else
    begin
      MessageDlg('Digite novamente seu endereço', mtError, [mbRetry], 0);
      edEndereco.SetFocus;
      exit
    end;


   //Verificar bairro
    if ((edBairro.Text <> '') and (Length(edBairro.Text) <= 40)) then
      Agenda[i].Bairro := UpperCase(edBairro.Text)
    else
    begin
      MessageDlg('Digite novamente seu bairro', mtError, [mbRetry], 0);
      edBairro.SetFocus;
      exit
    end;

    //Verrificar estado cívil
    if (cbEstadoCivil.ItemIndex = 0) then
      Agenda[i].Estado_Civil := 'S'
    else if (cbEstadoCivil.ItemIndex = 1) then
      Agenda[i].Estado_Civil := 'C'
    else if (cbEstadoCivil.ItemIndex = 2) then
      Agenda[i].Estado_Civil := 'D'
    else if (cbEstadoCivil.ItemIndex = 3) then
      Agenda[i].Estado_Civil := 'V'
    else
    begin
      MessageDlg('Selecione seu Estado Civil, por favor', mtError, [mbRetry], 0);
      exit
    end;


   //Verificar CEP
    if ((meCEP.Text <> '') and (Length(meCEP.Text) <= 9)) then
      Agenda[i].Cep := UpperCase(meCEP.Text)
    else
    begin
      MessageDlg('Digite novamente seu CEP', mtError, [mbRetry], 0);
      meCEP.SetFocus;
      exit
    end;



    Agenda[i].StatusReg := True ;  //Indisponibiliza a posição
    MessageDlg('Contato salvo com sucesso', mtConfirmation, [mbOK], 0);

    Break;

   end;


  end;

end;



//Procedimento que limpa o memo
procedure TfrmAgenda.btLimpar2Click(Sender: TObject);
begin
  mmContato.Clear;
end;


//Procedimento que limpa os Edit's
procedure TfrmAgenda.btLimparClick(Sender: TObject);
begin
  edNome.Text := '';
  edEndereco.Text := '';
  edBairro.Text := '';
  meTel_Comercial.Text := '';
  meTel_Residencial.Text := '';
  meCEP.Text := '';
  cbEstadoCivil.ItemIndex := -1;
  rgSexo.ItemIndex := -1;
  meData.Text := '';
end;


//Procedimento que realizará o save da Agenda
procedure TfrmAgenda.FormClose(Sender: TObject; var Action: TCloseAction);
var i : integer;
begin
    ReWrite(Arquivo);
    i := 0 ;
    while i < 100 do
    begin
      if (Agenda[i].StatusReg = True) then
      begin
        write(Arquivo, Agenda[i]);
      end;
      inc(i);
    end;
    CloseFile(Arquivo);
end;


//Procedimento buscará o arquivo no qual estão todos os dados da agenda
procedure TfrmAgenda.FormCreate(Sender: TObject);
var i : Integer;
begin
  AssignFile(Arquivo, 'Agenda$.txt');

  if FileExists('Agenda$.txt') then
  begin
    Reset(Arquivo);
  end
  else
  begin
    ReWrite(Arquivo);
  end;

  Seek(Arquivo,0);
  i := 0;
  while(Not eof(Arquivo)) do
  begin
    read(Arquivo , Agenda[i]);
    i := i + 1;
  end;

end;


//Procedimento que mostrará o memo
procedure TfrmAgenda.mostrarmemo(n: integer);
begin

          mmContato.Lines.Add('Nome: ' + Agenda[n].Nome);
          mmContato.Lines.Add('Data de nascimeto: ' + Agenda[n].Idade);
          mmContato.Lines.Add('Sexo: ' + Agenda[n].Sexo);
          mmContato.Lines.Add('Celular: ' + Agenda[n].Tel_Comercial);
          mmContato.Lines.Add('Telefone Residencial: ' + Agenda[n].Tel_Residencial);
          mmContato.Lines.Add('Endereço: ' + Agenda[n].Endereco);
          mmContato.Lines.Add('Bairro: ' + Agenda[n].Bairro);
          mmContato.Lines.Add('Estado Civil: ' + Agenda[n].Estado_Civil);
          mmContato.Lines.Add('CEP: ' + Agenda[n].Cep);
end;

end.

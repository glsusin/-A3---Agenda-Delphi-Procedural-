object frmAgenda: TfrmAgenda
  Left = 0
  Top = 0
  Caption = 'Agenda'
  ClientHeight = 481
  ClientWidth = 799
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  OnClose = FormClose
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object lbComercial: TLabel
    Left = 8
    Top = 183
    Width = 37
    Height = 13
    Caption = 'Celular:'
  end
  object lbData: TLabel
    Left = 8
    Top = 67
    Width = 99
    Height = 13
    Caption = 'Data de nascimento:'
  end
  object lbNome: TLabel
    Left = 8
    Top = 21
    Width = 77
    Height = 13
    Caption = 'Nome completo:'
  end
  object lbResidencial: TLabel
    Left = 8
    Top = 227
    Width = 99
    Height = 13
    Caption = 'Telefone residencial:'
  end
  object lbEndereco: TLabel
    Left = 8
    Top = 271
    Width = 52
    Height = 13
    Caption = 'Endere'#231'o: '
  end
  object lbBairro: TLabel
    Left = 8
    Top = 315
    Width = 35
    Height = 13
    Caption = 'Bairro: '
  end
  object Label1: TLabel
    Left = 8
    Top = 398
    Width = 26
    Height = 13
    Caption = 'CEP: '
  end
  object edNome: TEdit
    Left = 8
    Top = 40
    Width = 297
    Height = 21
    Hint = 'Nome completo'
    Color = clBtnHighlight
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    ParentShowHint = False
    ShowHint = True
    TabOrder = 0
  end
  object meData: TMaskEdit
    Left = 8
    Top = 86
    Width = 116
    Height = 21
    Hint = 'Data de nascimento'
    EditMask = '!99/99/99;0;_'
    MaxLength = 8
    ParentShowHint = False
    ShowHint = True
    TabOrder = 1
    Text = ''
  end
  object rgSexo: TRadioGroup
    Left = 8
    Top = 107
    Width = 120
    Height = 70
    Hint = 'Sexo'
    Caption = 'Sexo:'
    Items.Strings = (
      'Feminino'
      'Masculino')
    ParentShowHint = False
    ShowHint = True
    TabOrder = 2
  end
  object meTel_Comercial: TMaskEdit
    Left = 8
    Top = 200
    Width = 115
    Height = 21
    Hint = 'Celular'
    EditMask = '!\(99\)00000-0000;0;_'
    MaxLength = 14
    ParentShowHint = False
    ShowHint = True
    TabOrder = 3
    Text = ''
  end
  object meTel_Residencial: TMaskEdit
    Left = 8
    Top = 246
    Width = 115
    Height = 21
    Hint = 'Telofone residencial'
    EditMask = '!\(99\)0000-0000;0;_'
    MaxLength = 13
    ParentShowHint = False
    ShowHint = True
    TabOrder = 4
    Text = ''
  end
  object edEndereco: TEdit
    Left = 8
    Top = 290
    Width = 121
    Height = 21
    Hint = 'Endere'#231'o'
    ParentShowHint = False
    ShowHint = True
    TabOrder = 5
  end
  object edBairro: TEdit
    Left = 8
    Top = 328
    Width = 121
    Height = 21
    Hint = 'Bairro'
    ParentShowHint = False
    ShowHint = True
    TabOrder = 6
  end
  object cbEstadoCivil: TComboBox
    Left = 8
    Top = 368
    Width = 121
    Height = 21
    Hint = 'Estado C'#237'vil'
    ParentShowHint = False
    ShowHint = True
    TabOrder = 7
    Text = 'Estado C'#237'vil'
    Items.Strings = (
      'Solteiro'
      'Casado'
      'Divorciado'
      'Vi'#250'vo')
  end
  object meCEP: TMaskEdit
    Left = 6
    Top = 414
    Width = 118
    Height = 21
    Hint = 'CEP'
    EditMask = '00000-000;0;_'
    MaxLength = 9
    ParentShowHint = False
    ShowHint = True
    TabOrder = 8
    Text = ''
  end
  object btSalvar: TButton
    Left = 8
    Top = 441
    Width = 115
    Height = 32
    Caption = 'Salvar Contato'
    ParentShowHint = False
    ShowHint = True
    TabOrder = 9
    OnClick = btSalvarClick
  end
  object btDelete: TButton
    Left = 601
    Top = 273
    Width = 116
    Height = 32
    Hint = 'Delete'
    Caption = 'Deletar Contato'
    ParentShowHint = False
    ShowHint = True
    TabOrder = 10
    OnClick = btDeleteClick
  end
  object btLimpar: TButton
    Left = 311
    Top = 39
    Width = 51
    Height = 23
    Hint = 'Limpar campos'
    Caption = 'Limpar'
    ParentShowHint = False
    ShowHint = True
    TabOrder = 11
    OnClick = btLimparClick
  end
  object btBuscar: TButton
    Left = 499
    Top = 273
    Width = 96
    Height = 38
    Caption = 'Buscar Contato'
    ParentShowHint = False
    ShowHint = True
    TabOrder = 12
    OnClick = btBuscarClick
  end
  object mmContato: TMemo
    Left = 499
    Top = 40
    Width = 270
    Height = 227
    Enabled = False
    Lines.Strings = (
      'Contato')
    TabOrder = 13
  end
  object btLimpar2: TButton
    Left = 723
    Top = 273
    Width = 46
    Height = 24
    Caption = 'Limpar'
    TabOrder = 14
    OnClick = btLimpar2Click
  end
  object btAtualizar: TButton
    Left = 368
    Top = 38
    Width = 121
    Height = 25
    Caption = 'Atualizar Contato'
    TabOrder = 15
    OnClick = btAtualizarClick
  end
  object btSair: TButton
    Left = 711
    Top = 448
    Width = 75
    Height = 25
    Caption = 'Sair'
    TabOrder = 16
    OnClick = btSairClick
  end
  object btCancel: TButton
    Left = 392
    Top = 100
    Width = 75
    Height = 25
    Caption = 'Cancelar'
    Enabled = False
    TabOrder = 17
    OnClick = btCancelClick
  end
  object btAtualizar2: TButton
    Left = 376
    Top = 69
    Width = 105
    Height = 25
    Caption = 'Salvar Atualiza'#231#227'o'
    Enabled = False
    TabOrder = 18
    OnClick = btAtualizar2Click
  end
end

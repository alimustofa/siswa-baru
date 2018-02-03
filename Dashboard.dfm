object f_dashboard: Tf_dashboard
  Left = 236
  Top = 341
  Width = 846
  Height = 397
  Caption = 'DASHBOARD - SMK N 1 CIMAHI'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  Menu = MainMenu1
  OldCreateOrder = False
  Position = poScreenCenter
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 24
    Top = 24
    Width = 190
    Height = 25
    Caption = 'SELAMAT DATANG,'
    Font.Charset = ANSI_CHARSET
    Font.Color = clMaroon
    Font.Height = -20
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
  end
  object Label2: TLabel
    Left = 24
    Top = 56
    Width = 411
    Height = 25
    Caption = 'DI APLIKASI DATA SISWA SMK N  1 CIMAHI'
    Font.Charset = ANSI_CHARSET
    Font.Color = clMaroon
    Font.Height = -20
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
  end
  object Label3: TLabel
    Left = 48
    Top = 104
    Width = 416
    Height = 20
    Caption = 'Aplikasi ini untuk mendata siswa baru SMK Negeri 1 Cimahi'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
  end
  object Label4: TLabel
    Left = 48
    Top = 128
    Width = 422
    Height = 20
    Caption = 'yang akan memudahkan para Administrator dalam mendata'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
  end
  object Label5: TLabel
    Left = 48
    Top = 152
    Width = 79
    Height = 20
    Caption = 'siswa baru.'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
  end
  object Label6: TLabel
    Left = 24
    Top = 216
    Width = 85
    Height = 20
    Caption = 'MENU LIST'
    Font.Charset = ANSI_CHARSET
    Font.Color = clMaroon
    Font.Height = -16
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
  end
  object Label7: TLabel
    Left = 568
    Top = 48
    Width = 149
    Height = 24
    Caption = 'STATISTIK DATA'
    Font.Charset = ANSI_CHARSET
    Font.Color = clMaroon
    Font.Height = -19
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
  end
  object lb_jml_siswa: TLabel
    Left = 568
    Top = 168
    Width = 44
    Height = 46
    Caption = '30'
    Font.Charset = ANSI_CHARSET
    Font.Color = clMaroon
    Font.Height = -40
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
  end
  object Label8: TLabel
    Left = 568
    Top = 136
    Width = 122
    Height = 20
    Caption = 'JUMLAH SISWA'
    Font.Charset = ANSI_CHARSET
    Font.Color = clMaroon
    Font.Height = -16
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
  end
  object Label9: TLabel
    Left = 568
    Top = 80
    Width = 57
    Height = 20
    Caption = 'Jurusan'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -16
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
  end
  object Panel1: TPanel
    Left = 25
    Top = 96
    Width = 8
    Height = 81
    Color = clMaroon
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWhite
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
    TabOrder = 0
  end
  object cb_jurusan: TComboBox
    Left = 568
    Top = 104
    Width = 201
    Height = 21
    ItemHeight = 13
    TabOrder = 1
    OnChange = cb_jurusanChange
    OnKeyPress = cb_jurusanKeyPress
  end
  object Panel2: TPanel
    Left = 24
    Top = 248
    Width = 145
    Height = 41
    Caption = 'Data Siswa'
    Color = clMaroon
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWhite
    Font.Height = -13
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
    TabOrder = 2
    OnClick = Panel2Click
  end
  object Panel3: TPanel
    Left = 184
    Top = 248
    Width = 145
    Height = 41
    Caption = 'Data Jurusan'
    Color = clMaroon
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWhite
    Font.Height = -13
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
    TabOrder = 3
    OnClick = Panel3Click
  end
  object Panel4: TPanel
    Left = 344
    Top = 248
    Width = 145
    Height = 41
    Caption = 'Report Siswa'
    Color = clMaroon
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWhite
    Font.Height = -13
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
    TabOrder = 4
    OnClick = Panel4Click
  end
  object Panel5: TPanel
    Left = 504
    Top = 248
    Width = 145
    Height = 41
    Caption = 'About'
    Color = clMaroon
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWhite
    Font.Height = -13
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
    TabOrder = 5
    OnClick = Panel5Click
  end
  object Panel6: TPanel
    Left = 664
    Top = 248
    Width = 145
    Height = 41
    Caption = 'Keluar'
    Color = clMaroon
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWhite
    Font.Height = -13
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
    TabOrder = 6
    OnClick = Panel6Click
  end
  object ADOConnection1: TADOConnection
    ConnectionString = 
      'Provider=Microsoft.Jet.OLEDB.4.0;Data Source=E:\'#160'\Kuliah\Semeste' +
      'r 1\Pemrograman Visual\Project\UAS\db_siswa_baru.mdb;Persist Sec' +
      'urity Info=False'
    LoginPrompt = False
    Provider = 'Microsoft.Jet.OLEDB.4.0'
    Left = 320
    Top = 16
  end
  object q_temp: TADOQuery
    Connection = ADOConnection1
    Parameters = <>
    Left = 360
    Top = 16
  end
  object MainMenu1: TMainMenu
    Left = 280
    Top = 16
    object File1: TMenuItem
      Caption = '&File'
      object FormSiswa1: TMenuItem
        Caption = '&Form Siswa'
        OnClick = FormSiswa1Click
      end
      object FormJurusan1: TMenuItem
        Caption = 'Form &Jurusan'
        OnClick = FormJurusan1Click
      end
      object ReportSiswa1: TMenuItem
        Caption = '&Report Siswa'
        OnClick = ReportSiswa1Click
      end
      object N1: TMenuItem
        Caption = '-'
      end
      object Logout1: TMenuItem
        Caption = '&Logout'
        OnClick = Logout1Click
      end
      object Keluar1: TMenuItem
        Caption = '&Keluar'
        OnClick = Keluar1Click
      end
    end
    object About1: TMenuItem
      Caption = '&About'
      OnClick = About1Click
    end
  end
end

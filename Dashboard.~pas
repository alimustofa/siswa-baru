unit Dashboard;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Menus, StdCtrls, ExtCtrls, DB, ADODB;

type
  Tf_dashboard = class(TForm)
    Label1: TLabel;
    MainMenu1: TMainMenu;
    File1: TMenuItem;
    FormSiswa1: TMenuItem;
    ReportSiswa1: TMenuItem;
    N1: TMenuItem;
    Keluar1: TMenuItem;
    About1: TMenuItem;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Panel1: TPanel;
    FormJurusan1: TMenuItem;
    Logout1: TMenuItem;
    Label7: TLabel;
    lb_jml_siswa: TLabel;
    ADOConnection1: TADOConnection;
    q_temp: TADOQuery;
    Label8: TLabel;
    cb_jurusan: TComboBox;
    Label9: TLabel;
    Panel2: TPanel;
    Panel3: TPanel;
    Panel4: TPanel;
    Panel5: TPanel;
    Panel6: TPanel;
    procedure FormSiswa1Click(Sender: TObject);
    procedure ReportSiswa1Click(Sender: TObject);
    procedure About1Click(Sender: TObject);
    procedure m_aboutClick(Sender: TObject);
    procedure Keluar1Click(Sender: TObject);
    procedure m_keluarClick(Sender: TObject);
    procedure FormJurusan1Click(Sender: TObject);
    procedure Logout1Click(Sender: TObject);
    procedure m_dataClick(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure m_reportClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure cb_jurusanChange(Sender: TObject);
    procedure cb_jurusanKeyPress(Sender: TObject; var Key: Char);
    procedure Panel2Click(Sender: TObject);
    procedure Panel3Click(Sender: TObject);
    procedure Panel4Click(Sender: TObject);
    procedure Panel5Click(Sender: TObject);
    procedure Panel6Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  f_dashboard: Tf_dashboard;

implementation

uses Siswa, Report, Jurusan, Login;

{$R *.dfm}

procedure Tf_dashboard.FormSiswa1Click(Sender: TObject);
begin
  f_data.showModal();
end;

procedure Tf_dashboard.ReportSiswa1Click(Sender: TObject);
begin
  f_report.showModal();
end;

procedure Tf_dashboard.About1Click(Sender: TObject);
begin
  MessageDlg('Aplikasi Siswa Baru'+ chr(10) +'v.1', mtInformation, [mbOK], 0);
end;

procedure Tf_dashboard.m_aboutClick(Sender: TObject);
begin
  About1Click(Sender);
end;

procedure Tf_dashboard.Keluar1Click(Sender: TObject);
begin
  if (Application.MessageBox('Anda akan keluar?', 'Konfirmasi', MB_YESNO OR MB_ICONQUESTION) = idYes) then
    Application.Terminate;
end;

procedure Tf_dashboard.m_keluarClick(Sender: TObject);
begin
  Keluar1Click(Sender);
end;

procedure Tf_dashboard.FormJurusan1Click(Sender: TObject);
begin
  f_jurusan.showModal();
end;

procedure Tf_dashboard.Logout1Click(Sender: TObject);
begin
  Self.Close;
end;

procedure Tf_dashboard.m_dataClick(Sender: TObject);
begin
  FormSiswa1Click(Sender);
end;

procedure Tf_dashboard.Button1Click(Sender: TObject);
begin
  FormJurusan1Click(Sender);
end;

procedure Tf_dashboard.m_reportClick(Sender: TObject);
begin
  ReportSiswa1Click(Sender);
end;


procedure Tf_dashboard.FormShow(Sender: TObject);
begin
  q_temp.Close;
  q_temp.SQL.Clear;
  q_temp.SQL.Add('SELECT * FROM jurusan');
  q_temp.Open;

  cb_jurusan.Clear;

  while (q_temp.Eof = false) do
    begin
      cb_jurusan.Items.Add(q_temp.Fields[1].AsString);
      q_temp.Next;
    end;

  q_temp.Close;
  q_temp.SQL.Clear;
  q_temp.SQL.Add('SELECT * from siswa');
  q_temp.Open;

  lb_jml_siswa.Caption := IntToStr(q_temp.RecordCount);
end;

procedure Tf_dashboard.cb_jurusanChange(Sender: TObject);
var jurusanVal:String;
begin
  { Find jurusan id value }
  q_temp.Close;
  q_temp.SQL.Clear;
  q_temp.SQL.Add('SELECT * FROM jurusan WHERE Jurusan='''+ cb_jurusan.Text +'''');
  q_temp.Open;

  if (q_temp.RecordCount <> 0) then
    begin
      while (q_temp.Eof = false) do
        begin
          jurusanVal := q_temp.Fields[0].AsString;
          q_temp.Next;
        end;
    end
  else
    begin
      MessageDlg('Data jurusan tidak ditemukan', mtWarning, [mbOK], 0);
    end;

  q_temp.Close;
  q_temp.SQL.Clear;
  q_temp.SQL.Add('SELECT * from siswa WHERE jurusanId='''+ jurusanVal +'''');
  q_temp.Open;

  lb_jml_siswa.Caption := IntToStr(q_temp.RecordCount);

end;

procedure Tf_dashboard.cb_jurusanKeyPress(Sender: TObject; var Key: Char);
begin
  Key:=#0;
end;

procedure Tf_dashboard.Panel2Click(Sender: TObject);
begin
  FormSiswa1Click(Sender);
end;

procedure Tf_dashboard.Panel3Click(Sender: TObject);
begin
  FormJurusan1Click(Sender);
end;

procedure Tf_dashboard.Panel4Click(Sender: TObject);
begin
  ReportSiswa1Click(Sender);
end;

procedure Tf_dashboard.Panel5Click(Sender: TObject);
begin
  About1Click(Sender);
end;

procedure Tf_dashboard.Panel6Click(Sender: TObject);
begin
  Keluar1Click(Sender);
end;

end.

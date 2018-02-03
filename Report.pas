unit Report;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, QuickRpt, ExtCtrls, StdCtrls, QRCtrls, DB, ADODB;

type
  Tf_report = class(TForm)
    QuickRep1: TQuickRep;
    TitleBand1: TQRBand;
    ColumnHeaderBand1: TQRBand;
    DetailBand1: TQRBand;
    PageFooterBand1: TQRBand;
    Label10: TLabel;
    Label1: TLabel;
    GroupBox2: TGroupBox;
    cb_jurusan: TComboBox;
    Label3: TLabel;
    QRLabel1: TQRLabel;
    QRLabel2: TQRLabel;
    QRLabel3: TQRLabel;
    QRLabel4: TQRLabel;
    QRLabel5: TQRLabel;
    QRLabel6: TQRLabel;
    QRLabel8: TQRLabel;
    QRSysData1: TQRSysData;
    NISN: TQRDBText;
    Nama: TQRDBText;
    TglLahir: TQRDBText;
    Jurusan: TQRDBText;
    AsalSekolah: TQRDBText;
    QRLabel7: TQRLabel;
    QRSysData2: TQRSysData;
    ADOConnection1: TADOConnection;
    q_report: TADOQuery;
    DataSource1: TDataSource;
    Image3: TImage;
    Panel1: TPanel;
    Panel2: TPanel;
    Panel3: TPanel;
    procedure b_backClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure cb_jurusanKeyPress(Sender: TObject; var Key: Char);
    procedure Image3Click(Sender: TObject);
    procedure Panel2Click(Sender: TObject);
    procedure Panel3Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  f_report: Tf_report;

implementation

uses Dashboard;

{$R *.dfm}

procedure Tf_report.b_backClick(Sender: TObject);
begin
  Self.Close;
end;

procedure Tf_report.FormShow(Sender: TObject);
begin
  q_report.Close;
  q_report.SQL.Clear;
  q_report.SQL.Add('SELECT * FROM jurusan');
  q_report.Open;

  cb_jurusan.Clear;

  while (q_report.Eof = false) do
    begin
      cb_jurusan.Items.Add(q_report.Fields[1].AsString);
      q_report.Next;
    end;
end;

procedure Tf_report.cb_jurusanKeyPress(Sender: TObject; var Key: Char);
begin
  Key:=#0;
end;

procedure Tf_report.Image3Click(Sender: TObject);
begin
  Self.Close;
end;

procedure Tf_report.Panel2Click(Sender: TObject);
var
  sql1, sql2, sqlType:String;
begin
  sql1 := 'SELECT s.*, j.Jurusan AS jurusan FROM siswa s LEFT JOIN jurusan j ON s.JurusanId=j.Id';
  sql2 := 'SELECT s.*, j.Jurusan AS jurusan FROM siswa s LEFT JOIN jurusan j ON s.JurusanId=j.Id WHERE jurusan='''+ cb_jurusan.Text +'''';

  if (cb_jurusan.Text = '') then
    begin
      sqlType := sql1;
    end
  else
    begin
      sqlType := sql2;
    end;

  q_report.Close;
  q_report.SQL.Clear;
  q_report.SQL.Add(sqlType);
  q_report.Open;

  if (q_report.RecordCount <> 0) then
    begin
      QuickRep1.Preview;
    end
  else
    begin
      MessageDlg('Data siswa kosong', mtInformation, [mbOK], 0);
    end
end;

procedure Tf_report.Panel3Click(Sender: TObject);
begin
  QuickRep1.Print;
end;

end.

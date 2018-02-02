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
    b_back: TButton;
    GroupBox2: TGroupBox;
    cb_jurusan: TComboBox;
    b_preview: TButton;
    b_print: TButton;
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
    procedure b_backClick(Sender: TObject);
    procedure b_previewClick(Sender: TObject);
    procedure b_printClick(Sender: TObject);
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
  Self.Hide;
  f_dashboard.ShowModal();
end;

procedure Tf_report.b_previewClick(Sender: TObject);
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

procedure Tf_report.b_printClick(Sender: TObject);
begin
  QuickRep1.Print;
end;

end.

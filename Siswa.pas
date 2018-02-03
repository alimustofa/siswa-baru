unit Siswa;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ComCtrls, Grids, DBGrids, DB, ADODB, ExtCtrls;

type
  Tf_data = class(TForm)
    Label1: TLabel;
    GroupBox1: TGroupBox;
    Label3: TLabel;
    tb_nisn: TEdit;
    Label2: TLabel;
    tb_nama: TEdit;
    Label4: TLabel;
    tb_tmpLahir: TEdit;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    tb_tglLahir: TDateTimePicker;
    Label8: TLabel;
    cb_jurusan: TComboBox;
    tb_asalSekolah: TEdit;
    tb_alamat: TEdit;
    b_new: TButton;
    b_save: TButton;
    b_del: TButton;
    b_reset: TButton;
    DBGrid1: TDBGrid;
    GroupBox2: TGroupBox;
    Label9: TLabel;
    tb_nisnCari: TEdit;
    b_cari: TButton;
    q_table: TADOQuery;
    ADOConnection1: TADOConnection;
    q_temp: TADOQuery;
    DataSource1: TDataSource;
    Label10: TLabel;
    q_combo: TADOQuery;
    Panel1: TPanel;
    Image1: TImage;
    Image2: TImage;
    Image3: TImage;
    Label11: TLabel;
    cb_jalur: TComboBox;
    procedure b_resetClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure b_newClick(Sender: TObject);
    procedure b_saveClick(Sender: TObject);
    procedure b_delClick(Sender: TObject);
    procedure b_cariClick(Sender: TObject);
    procedure b_backClick(Sender: TObject);
    procedure cb_jurusanKeyPress(Sender: TObject; var Key: Char);
    procedure Image3Click(Sender: TObject);
    procedure cb_jalurKeyPress(Sender: TObject; var Key: Char);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  f_data: Tf_data;

implementation

uses Dashboard;

{$R *.dfm}

procedure Tf_data.b_resetClick(Sender: TObject);
begin
  tb_nisn.Clear;
  tb_nama.Clear;
  tb_tmpLahir.Clear;
  cb_jurusan.Text:='';
  tb_asalSekolah.Clear;
  tb_alamat.Clear;
  tb_tglLahir.Date := Now;
  cb_jalur.Text:='';

  tb_nisn.SetFocus;

  q_table.Close;
  q_table.SQL.Clear;
  q_table.SQL.Add('SELECT s.*, j.Jurusan AS jurusan FROM siswa s LEFT JOIN jurusan j ON s.JurusanId=j.Id');
  q_table.Open;
end;

procedure Tf_data.FormShow(Sender: TObject);
begin
  Visible := true;
  b_resetClick(Sender);

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
end;

procedure Tf_data.b_newClick(Sender: TObject);
begin
  b_resetClick(Sender);
end;

procedure Tf_data.b_saveClick(Sender: TObject);
var msg:String;
begin
  q_temp.Close;
  q_temp.SQL.Clear;
  q_temp.SQL.Add('SELECT * FROM siswa WHERE NISN='''+ tb_nisn.Text +'''');
  q_temp.Open;

  if (q_temp.RecordCount = 0) then
    begin
      q_temp.Close;
      q_temp.SQL.Clear;
      q_temp.SQL.Add('INSERT INTO siswa(NISN, Nama, TmpLahir, TglLahir, AsalSekolah, JurusanId, Alamat, Jalur) VALUES(:vNISN, :vNama, :vTmpLahir, :vTglLahir, :vAsalSekolah, :vJurusanId, :vAlamat, :vJalur)');
      q_temp.Parameters.ParamByName('vNISN').Value := tb_nisn.Text;

      msg := 'Data berhasil disimpan';
    end
  else
    begin
      q_temp.Close;
      q_temp.SQL.Clear;
      q_temp.SQL.Add('UPDATE siswa SET Nama=:vNama, TmpLahir=:vTmpLahir, TglLahir=:vTglLahir, AsalSekolah=:vAsalSekolah, JurusanId=:vJurusanId, Alamat=:vAlamat, Jalur=:vJalur WHERE NISN='''+ tb_nisn.Text +'''');

      msg := 'Data berhasil diubah';
    end;

  q_temp.Parameters.ParamByName('vNama').Value := tb_nama.Text;
  q_temp.Parameters.ParamByName('vTmpLahir').Value := tb_tmpLahir.Text;
  q_temp.Parameters.ParamByName('vTglLahir').Value := DateToStr(tb_tglLahir.Date);
  q_temp.Parameters.ParamByName('vAsalSekolah').Value := tb_asalSekolah.Text;
  q_temp.Parameters.ParamByName('vAlamat').Value := tb_alamat.Text;     
  q_temp.Parameters.ParamByName('vJalur').Value := cb_jalur.Text;

  { Find jurusan id value }
  q_combo.Close;
  q_combo.SQL.Clear;
  q_combo.SQL.Add('SELECT * FROM jurusan WHERE Jurusan='''+ cb_jurusan.Text +'''');
  q_combo.Open;

  if (q_combo.RecordCount <> 0) then
    begin
      while (q_combo.Eof = false) do
        begin
          q_temp.Parameters.ParamByName('vJurusanId').Value := q_combo.Fields[0].AsString;
          q_combo.Next;
        end;
    end
  else
    begin
      MessageDlg('Data jurusan tidak ditemukan', mtWarning, [mbOK], 0);
    end;

  q_temp.ExecSQL;

  MessageDlg(msg, mtInformation, [mbOK], 0);
  b_resetClick(Sender);
end;

procedure Tf_data.b_delClick(Sender: TObject);
begin
  if (tb_nisn.Text = '') then
    begin
      MessageDlg('Data nisn kosong', mtError, [mbOK], 1);
    end
  else
    begin
      if (Application.MessageBox('Data akan dihapus?', 'Konfirmasi', MB_ICONQUESTION OR MB_YESNO) = idYes) then
        begin
          q_temp.Close;
          q_temp.SQL.Clear;
          q_temp.SQL.Add('DELETE FROM siswa WHERE NISN='''+ tb_nisn.Text +'''');
          q_temp.ExecSQL;

          MessageDlg('Data berhasil dihapus', mtInformation, [mbOK], 0);
          b_resetClick(Sender);
        end
    end
end;

procedure Tf_data.b_cariClick(Sender: TObject);
begin
  q_temp.Close;
  q_temp.SQL.Clear;
  q_temp.SQL.Add('SELECT s.*, j.Jurusan AS jurusan FROM siswa s LEFT JOIN jurusan j ON s.JurusanId=j.Id WHERE s.NISN='''+ tb_nisnCari.Text +'''');
  q_temp.Open;

  if (q_temp.RecordCount <> 0) then
    begin
      tb_nisn.Text := q_temp['NISN'];
      tb_nama.Text := q_temp['Nama'];
      tb_tmpLahir.Text := q_temp['TmpLahir'];
      tb_tglLahir.Date := q_temp['TglLahir'];
      cb_jurusan.Text := q_temp['jurusan'];
      tb_asalSekolah.Text := q_temp['AsalSekolah'];
      tb_alamat.Text := q_temp['Alamat'];
      cb_jalur.Text := q_temp['Jalur'];
    end
  else
    begin
      MessageDlg('Data tidak ditemukan', mtInformation, [mbOK], 0);
    end
end;

procedure Tf_data.b_backClick(Sender: TObject);
begin
  Self.Close;
end;

procedure Tf_data.cb_jurusanKeyPress(Sender: TObject; var Key: Char);
begin
  Key:=#0;
end;

procedure Tf_data.Image3Click(Sender: TObject);
begin
  Self.Close;
end;


procedure Tf_data.cb_jalurKeyPress(Sender: TObject; var Key: Char);
begin
  Key:=#0;
end;

end.

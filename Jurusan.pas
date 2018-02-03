unit Jurusan;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, DB, ADODB, Grids, DBGrids, StdCtrls;

type
  Tf_jurusan = class(TForm)
    Label1: TLabel;
    Label10: TLabel;
    GroupBox1: TGroupBox;
    Label3: TLabel;
    tb_kode: TEdit;
    DBGrid1: TDBGrid;
    q_table: TADOQuery;
    ADOConnection1: TADOConnection;
    q_temp: TADOQuery;
    DataSource1: TDataSource;
    Panel1: TPanel;
    tb_nama: TEdit;
    Label2: TLabel;
    q_combo: TADOQuery;
    Image3: TImage;
    Panel2: TPanel;
    Panel3: TPanel;
    Panel4: TPanel;
    Panel5: TPanel;
    procedure b_resetClick(Sender: TObject);
    procedure b_backClick(Sender: TObject);
    procedure b_saveClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure b_delClick(Sender: TObject);
    procedure Image3Click(Sender: TObject);
    procedure b_newClick(Sender: TObject);
    procedure Panel2Click(Sender: TObject);
    procedure Panel3Click(Sender: TObject);
    procedure Panel4Click(Sender: TObject);
    procedure Panel5Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  f_jurusan: Tf_jurusan;

implementation

uses Dashboard;

{$R *.dfm}

procedure Tf_jurusan.b_resetClick(Sender: TObject);
begin
  tb_kode.Clear;
  tb_nama.Clear;

  tb_kode.SetFocus;

  q_table.Close;
  q_table.SQL.Clear;
  q_table.SQL.Add('SELECT * FROM jurusan');
  q_table.Open;
end;

procedure Tf_jurusan.b_backClick(Sender: TObject);
begin
  Self.Close;
end;

procedure Tf_jurusan.b_saveClick(Sender: TObject);
var msg:String;
begin
  q_temp.Close;
  q_temp.SQL.Clear;
  q_temp.SQL.Add('SELECT * FROM jurusan WHERE ID='''+ tb_kode.Text +'''');
  q_temp.Open;

  if (q_temp.RecordCount = 0) then
    begin
      q_temp.Close;
      q_temp.SQL.Clear;
      q_temp.SQL.Add('INSERT INTO jurusan(ID, Jurusan) VALUES(:vID, :vJurusan)');
      q_temp.Parameters.ParamByName('vID').Value := tb_kode.Text;

      msg := 'Data berhasil disimpan';
    end
  else
    begin
      q_temp.Close;
      q_temp.SQL.Clear;
      q_temp.SQL.Add('UPDATE jurusan SET Jurusan=:vJurusan WHERE ID='''+ tb_kode.Text +'''');

      msg := 'Data berhasil diubah';
    end;

  q_temp.Parameters.ParamByName('vJurusan').Value := tb_nama.Text;
  q_temp.ExecSQL;

  MessageDlg(msg, mtInformation, [mbOK], 0);
  b_resetClick(Sender);
end;

procedure Tf_jurusan.FormShow(Sender: TObject);
begin
  b_resetClick(Sender);
end;

procedure Tf_jurusan.b_delClick(Sender: TObject);
begin
  if (tb_kode.Text = '') then
    begin
      MessageDlg('Data kode kosong', mtError, [mbOK], 1);
    end
  else
    begin
      if (Application.MessageBox('Data akan dihapus?', 'Konfirmasi', MB_ICONQUESTION OR MB_YESNO) = idYes) then
        begin
          q_temp.Close;
          q_temp.SQL.Clear;
          q_temp.SQL.Add('DELETE FROM jurusan WHERE ID='''+ tb_kode.Text +'''');
          q_temp.ExecSQL;

          MessageDlg('Data berhasil dihapus', mtInformation, [mbOK], 0);
          b_resetClick(Sender);
        end
    end
end;

procedure Tf_jurusan.Image3Click(Sender: TObject);
begin
  Self.Close;
end;

procedure Tf_jurusan.b_newClick(Sender: TObject);
begin
  b_resetClick(Sender);
end;

procedure Tf_jurusan.Panel2Click(Sender: TObject);
begin
  b_resetClick(Sender);
end;

procedure Tf_jurusan.Panel3Click(Sender: TObject);
var msg:String;
begin
  q_temp.Close;
  q_temp.SQL.Clear;
  q_temp.SQL.Add('SELECT * FROM jurusan WHERE ID='''+ tb_kode.Text +'''');
  q_temp.Open;

  if (q_temp.RecordCount = 0) then
    begin
      q_temp.Close;
      q_temp.SQL.Clear;
      q_temp.SQL.Add('INSERT INTO jurusan(ID, Jurusan) VALUES(:vID, :vJurusan)');
      q_temp.Parameters.ParamByName('vID').Value := tb_kode.Text;

      msg := 'Data berhasil disimpan';
    end
  else
    begin
      q_temp.Close;
      q_temp.SQL.Clear;
      q_temp.SQL.Add('UPDATE jurusan SET Jurusan=:vJurusan WHERE ID='''+ tb_kode.Text +'''');

      msg := 'Data berhasil diubah';
    end;

  q_temp.Parameters.ParamByName('vJurusan').Value := tb_nama.Text;
  q_temp.ExecSQL;

  MessageDlg(msg, mtInformation, [mbOK], 0);
  b_resetClick(Sender);
end;

procedure Tf_jurusan.Panel4Click(Sender: TObject);
begin
  if (tb_kode.Text = '') then
    begin
      MessageDlg('Data kode kosong', mtError, [mbOK], 1);
    end
  else
    begin
      if (Application.MessageBox('Data akan dihapus?', 'Konfirmasi', MB_ICONQUESTION OR MB_YESNO) = idYes) then
        begin
          q_temp.Close;
          q_temp.SQL.Clear;
          q_temp.SQL.Add('DELETE FROM jurusan WHERE ID='''+ tb_kode.Text +'''');
          q_temp.ExecSQL;

          MessageDlg('Data berhasil dihapus', mtInformation, [mbOK], 0);
          b_resetClick(Sender);
        end
    end
end;

procedure Tf_jurusan.Panel5Click(Sender: TObject);
begin
  tb_kode.Clear;
  tb_nama.Clear;

  tb_kode.SetFocus;

  q_table.Close;
  q_table.SQL.Clear;
  q_table.SQL.Add('SELECT * FROM jurusan');
  q_table.Open;
end;

end.

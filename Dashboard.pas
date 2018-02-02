unit Dashboard;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Menus, StdCtrls;

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
    Button1: TButton;
    Button2: TButton;
    Button3: TButton;
    Button4: TButton;
    procedure FormSiswa1Click(Sender: TObject);
    procedure ReportSiswa1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  f_dashboard: Tf_dashboard;

implementation

uses Siswa, Report;

{$R *.dfm}

procedure Tf_dashboard.FormSiswa1Click(Sender: TObject);
begin
  Self.Hide;
  f_data.showModal();
end;

procedure Tf_dashboard.ReportSiswa1Click(Sender: TObject);
begin
  Self.Hide;
  f_report.showModal();
end;

end.

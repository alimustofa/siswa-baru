program SiswaBaru;

uses
  Forms,
  Login in 'Login.pas' {f_login},
  Dashboard in 'Dashboard.pas' {f_dashboard},
  Siswa in 'Siswa.pas' {f_data},
  Report in 'Report.pas' {f_report};

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(Tf_data, f_data);
  Application.CreateForm(Tf_login, f_login);
  Application.CreateForm(Tf_dashboard, f_dashboard);
  Application.CreateForm(Tf_report, f_report);
  Application.Run;
end.

unit Globals;

interface

type
  TGlobals = class(TObject)

  public
    constructor create();
    function sendEmail(subject, body, address: string): string;
  end;


implementation

uses
  Windows, SysUtils, Math, ShellAPI, Classes;

constructor TGlobals.create;
begin
 // it constructs I guess...
end;

function TGlobals.sendEmail(subject, body, address: string): string;
var
  ExePath: string;
  Parameters: string;
  StartupInfo: TStartupInfo;
  ProcessInfo: TProcessInformation;
  SecurityAttr: TSecurityAttributes;
  PipeRead, PipeWrite: THandle;
  Buffer: array [0 .. 255] of AnsiChar;
  BytesRead, BytesWritten: DWORD;
  OutputText: string;
begin
  ExePath := 'C:\Users\Andre\Documents\GitHub\PayRatesGr12PAT\send_email.exe';
  Parameters := '"' + subject + '" "' + body + '" ' + address;

  // Set up security attributes for the pipe
  SecurityAttr.nLength := SizeOf(TSecurityAttributes);
  SecurityAttr.bInheritHandle := True;
  SecurityAttr.lpSecurityDescriptor := nil;

  // Create a pipe for the child process's stdout
  if not CreatePipe(PipeRead, PipeWrite, @SecurityAttr, 0) then
    raise Exception.Create('Error creating pipe');

  // Set up startup information for the child process
  FillChar(StartupInfo, SizeOf(TStartupInfo), 0);
  StartupInfo.cb := SizeOf(TStartupInfo);
  StartupInfo.hStdOutput := PipeWrite;
  StartupInfo.dwFlags := STARTF_USESHOWWINDOW or STARTF_USESTDHANDLES;
  StartupInfo.wShowWindow := SW_HIDE; // Hide the child process's window

  // Create the child process
  if not CreateProcess(nil, PChar(ExePath + ' ' + Parameters), nil, nil, True,
    CREATE_NO_WINDOW, nil, nil, StartupInfo, ProcessInfo) then
  begin
    CloseHandle(PipeRead);
    CloseHandle(PipeWrite);
    raise Exception.Create('Error creating process');
  end;

  CloseHandle(PipeWrite); // Close the write end of the pipe in the parent process

  // Read from the pipe until there's no more data
  OutputText := '';
  repeat
    if ReadFile(PipeRead, Buffer, Length(Buffer), BytesRead, nil) then
    begin
      OutputText := OutputText + AnsiString(Buffer);
    end;
  until BytesRead = 0;

  CloseHandle(PipeRead); // Close the read end of the pipe in the parent process

  // Display the captured output in a message box
  Result := OutputText;
end;

end.

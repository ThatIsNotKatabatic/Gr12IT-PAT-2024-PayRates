unit Globals;

interface

uses
  Windows, Messages, Dialogs, SysUtils, Math, ShellAPI, Classes, mainDB;

type
  TGlobals = class(TObject)
  public
    constructor create();
    function sendEmail(subject, body, address: string): string;
    procedure setSQL(SQL: string);
  end;

implementation

// Constructor for TGlobals class
constructor TGlobals.create;
begin
  // This constructor initializes the TGlobals instance
  // (no specific implementation provided here)
end;

// Procedure to execute an SQL query
procedure TGlobals.setSQL(SQL: String);
var
  sInstr: String;  // SQL command type (e.g., SELECT, UPDATE)
  iPos: integer;   // Position of the first space in the SQL query
begin
  if Trim(SQL) <> '' then
  begin
    // Extract the SQL command type (e.g., SELECT, UPDATE)
    iPos := pos(' ', SQL);
    sInstr := UpperCase(copy(SQL, 1, iPos - 1));

    // Check if the SQL command is a SELECT query
    if sInstr = 'SELECT' then
    begin
      // Close any open query and clear previous SQL statements
      mainDB.dbmMainDB.UserQuery.Close;
      mainDB.dbmMainDB.UserQuery.SQL.Clear;
      // Add the new SQL query and open it
      mainDB.dbmMainDB.UserQuery.SQL.Add(SQL);
      mainDB.dbmMainDB.UserQuery.Open;

    end
    // Check if the SQL command is an UPDATE, DELETE, or INSERT query
    else if (sInstr = 'UPDATE') OR (sInstr = 'DELETE') OR (sInstr = 'INSERT') then
    begin
      // Clear previous SQL statements
      mainDB.dbmMainDB.UserQuery.SQL.Clear;
      // Add the new SQL query and execute it
      mainDB.dbmMainDB.UserQuery.SQL.Add(SQL);
      mainDB.dbmMainDB.UserQuery.ExecSQL;
      // Show a message with the number of affected records
      showmessage(inttostr(mainDB.dbmMainDB.UserQuery.RowsAffected) + ' record/s modified.');

    end
    else
    begin
      // Inform the user if the SQL contains an invalid instruction
      showmessage('SQL contains an invalid instruction');
    end;

  end
  else
  begin
    // Inform the user if the SQL query is blank
    showmessage('SQL is blank. Cannot execute.');
  end;
end;

// Function to send an email using an external executable
function TGlobals.sendEmail(subject, body, address: string): string;
var
  ExePath: string;                // Path to the external executable
  Parameters: string;             // Command-line parameters for the executable
  StartupInfo: TStartupInfo;      // Startup information for the new process
  ProcessInfo: TProcessInformation;  // Process information for the new process
  SecurityAttr: TSecurityAttributes;  // Security attributes for the pipe
  PipeRead, PipeWrite: THandle;   // Handles for the read and write ends of the pipe
  Buffer: array [0 .. 255] of AnsiChar;  // Buffer for reading process output
  BytesRead, BytesWritten: DWORD;  // Number of bytes read and written
  OutputText: string;              // Captured output from the process
begin
  ExePath := 'C:\Users\Andre\Documents\GitHub\PayRatesGr12PAT\send_email.exe';
  Parameters := '"' + subject + '" "' + body + '" ' + address;

  // Set up security attributes for the pipe
  SecurityAttr.nLength := SizeOf(TSecurityAttributes);
  SecurityAttr.bInheritHandle := True;
  SecurityAttr.lpSecurityDescriptor := nil;

  // Create a pipe for the child process's standard output
  if not CreatePipe(PipeRead, PipeWrite, @SecurityAttr, 0) then
    raise Exception.Create('Error creating pipe');

  // Set up startup information for the child process
  FillChar(StartupInfo, SizeOf(TStartupInfo), 0);
  StartupInfo.cb := SizeOf(TStartupInfo);
  StartupInfo.hStdOutput := PipeWrite;
  StartupInfo.dwFlags := STARTF_USESHOWWINDOW or STARTF_USESTDHANDLES;
  StartupInfo.wShowWindow := SW_HIDE; // Hide the child process's window

  // Create the child process to execute the email sending program
  if not CreateProcess(nil, PChar(ExePath + ' ' + Parameters), nil, nil, True,
    CREATE_NO_WINDOW, nil, nil, StartupInfo, ProcessInfo) then
  begin
    CloseHandle(PipeRead);
    CloseHandle(PipeWrite);
    raise Exception.Create('Error creating process');
  end;

  CloseHandle(PipeWrite); // Close the write end of the pipe in the parent process

  // Read the output from the pipe
  OutputText := '';
  repeat
    if ReadFile(PipeRead, Buffer, Length(Buffer), BytesRead, nil) then
    begin
      OutputText := OutputText + AnsiString(Buffer);
    end;
  until BytesRead = 0;

  CloseHandle(PipeRead); // Close the read end of the pipe in the parent process

  // Return the captured output from the process
  Result := OutputText;
end;

end.


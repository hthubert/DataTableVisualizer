; Script generated by the Inno Setup Script Wizard.
; SEE THE DOCUMENTATION FOR DETAILS ON CREATING INNO SETUP SCRIPT FILES!

#define DllDir "D:\Source\DataTableVisualizer\DataTableVisualizerInstaller\Compiled\"
#define ScriptDir "D:\Source\DataTableVisualizer\DataTableVisualizerInstaller\Scripts\"
#define MyAppName "DataTableVisualizer"
#define MyAppVersion "1.0"
#define MyAppPublisher "ShineTools"
#define VsFolder "C:\Program Files (x86)\Microsoft Visual Studio\2017\Professional\"
#define VsVisualizerFolder "\Common7\Packages\Debugger\Visualizers"
#define PowershellScript "InstallDataTableVisualizer.ps1"

[Setup]
; NOTE: The value of AppId uniquely identifies this application.
; Do not use the same AppId value in installers for other applications.
; (To generate a new GUID, click Tools | Generate GUID inside the IDE.)
AppId={{9FD2F4FF-5780-4B29-8525-B5F36981C05F}
AppName={#MyAppName}
AppVersion={#MyAppVersion}
;AppVerName={#MyAppName} {#MyAppVersion}
AppPublisher={#MyAppPublisher}
DefaultDirName={code:GetVsVizPath}
DisableDirPage=yes
DefaultGroupName={#MyAppName}
DisableProgramGroupPage=yes
OutputBaseFilename=DataTableVisualizerSetup
Compression=lzma
SolidCompression=yes
UsePreviousAppDir=no
PrivilegesRequired=admin

[Languages]

Name: "english"; MessagesFile: "compiler:Default.isl"

[Files]
Source: "{#DllDir}EnvDTE.dll"; DestDir: "{code:GetVsVizPath}"; Flags: ignoreversion
Source: "{#DllDir}Microsoft.MSXML.dll"; DestDir: "{code:GetVsVizPath}"; Flags: ignoreversion
Source: "{#DllDir}Microsoft.VisualStudio.ComponentModelHost.dll"; DestDir: "{code:GetVsVizPath}"; Flags: ignoreversion
Source: "{#DllDir}Microsoft.VisualStudio.CoreUtility.dll"; DestDir: "{code:GetVsVizPath}"; Flags: ignoreversion
Source: "{#DllDir}Microsoft.VisualStudio.GraphModel.dll"; DestDir: "{code:GetVsVizPath}"; Flags: ignoreversion
Source: "{#DllDir}Microsoft.VisualStudio.ImageCatalog.dll"; DestDir: "{code:GetVsVizPath}"; Flags: ignoreversion
Source: "{#DllDir}Microsoft.VisualStudio.Imaging.dll"; DestDir: "{code:GetVsVizPath}"; Flags: ignoreversion
Source: "{#DllDir}Microsoft.VisualStudio.OLE.Interop.dll"; DestDir: "{code:GetVsVizPath}"; Flags: ignoreversion
Source: "{#DllDir}Microsoft.VisualStudio.ProjectAggregator.dll"; DestDir: "{code:GetVsVizPath}"; Flags: ignoreversion
Source: "{#DllDir}Microsoft.VisualStudio.Shell.15.0.dll"; DestDir: "{code:GetVsVizPath}"; Flags: ignoreversion
Source: "{#DllDir}Microsoft.VisualStudio.Shell.Framework.dll"; DestDir: "{code:GetVsVizPath}"; Flags: ignoreversion
Source: "{#DllDir}Microsoft.VisualStudio.Shell.Interop.8.0.dll"; DestDir: "{code:GetVsVizPath}"; Flags: ignoreversion
Source: "{#DllDir}Microsoft.VisualStudio.Shell.Interop.9.0.dll"; DestDir: "{code:GetVsVizPath}"; Flags: ignoreversion
Source: "{#DllDir}Microsoft.VisualStudio.Shell.Interop.dll"; DestDir: "{code:GetVsVizPath}"; Flags: ignoreversion
Source: "{#DllDir}Microsoft.VisualStudio.Text.Data.dll"; DestDir: "{code:GetVsVizPath}"; Flags: ignoreversion
Source: "{#DllDir}Microsoft.VisualStudio.TextManager.Interop.8.0.dll"; DestDir: "{code:GetVsVizPath}"; Flags: ignoreversion
Source: "{#DllDir}Microsoft.VisualStudio.TextManager.Interop.dll"; DestDir: "{code:GetVsVizPath}"; Flags: ignoreversion
Source: "{#DllDir}Microsoft.VisualStudio.Threading.dll"; DestDir: "{code:GetVsVizPath}"; Flags: ignoreversion
Source: "{#DllDir}Microsoft.VisualStudio.Utilities.dll"; DestDir: "{code:GetVsVizPath}"; Flags: ignoreversion
Source: "{#DllDir}Microsoft.VisualStudio.Validation.dll"; DestDir: "{code:GetVsVizPath}"; Flags: ignoreversion
Source: "{#DllDir}Microsoft.VisualStudio.VSHelp.dll"; DestDir: "{code:GetVsVizPath}"; Flags: ignoreversion
Source: "{#DllDir}NamedPipeWrapper.dll"; DestDir: "{code:GetVsVizPath}"; Flags: ignoreversion
Source: "{#DllDir}ShineTools.DataTableViewer.dll"; DestDir: "{code:GetVsVizPath}"; Flags: ignoreversion
Source: "{#DllDir}ShineTools.DataTableVisualizer.dll"; DestDir: "{code:GetVsVizPath}"; Flags: ignoreversion
Source: "{#DllDir}stdole.dll"; DestDir: "{code:GetVsVizPath}"; Flags: ignoreversion
Source: "{#DllDir}StringToExpression.dll"; DestDir: "{code:GetVsVizPath}"; Flags: ignoreversion
Source: "{#DllDir}System.Threading.Tasks.Dataflow.dll"; DestDir: "{code:GetVsVizPath}"; Flags: ignoreversion
Source: "{#DllDir}Xceed.Wpf.Controls.v6.4.dll"; DestDir: "{code:GetVsVizPath}"; Flags: ignoreversion
Source: "{#DllDir}Xceed.Wpf.DataGrid.dll"; DestDir: "{code:GetVsVizPath}"; Flags: ignoreversion
Source: "{#DllDir}Xceed.Wpf.Toolkit.dll"; DestDir: "{code:GetVsVizPath}"; Flags: ignoreversion
Source: "{#DllDir}DataTableVisualizerExtension.vsix"; DestDir: "{code:GetVsVizPath}"; Flags: ignoreversion
Source: "{#ScriptDir}{#PowershellScript}"; DestDir: "{code:GetVsVizPath}"; Flags: ignoreversion
; NOTE: Don't use "Flags: ignoreversion" on any shared system files

[Icons]
Name: "{group}\{cm:UninstallProgram,{#MyAppName}}"; Filename: "{uninstallexe}"

[Code]
var
  VsPath: string;

procedure InitializeWizard();
var 
  VsPathInput: TInputDirWizardPage;
begin   
   VsPathInput := CreateInputDirPage(wpSelectDir, 'Select Visual Studio directory', '',  '', False, '');
   VsPathInput.Add('Please find the path to the Visual Studio installation you wish to install to. For example, "C:\Program Files (x86)\Microsoft Visual Studio\2017\Professional\".');
   VsPathInput.Values[0] := '{#VsFolder}';
   VsPath := VsPathInput.Values[0];
end;

function GetVsPath(Default: string): string;
begin
  Result := VsPath;
end;

function GetVsVizPath(Default: string): string;
begin
  Log(VsPath + '{#VsVisualizerFolder}');
  Result := VsPath + '{#VsVisualizerFolder}';
end;

procedure CurStepChanged(CurStep: TSetupStep);
var
  ErrorCode: Integer;
  ReturnCode: Boolean;
  arguments: String;
begin
  if CurStep = ssPostInstall then begin
    
    ExtractTemporaryFile('{#PowershellScript}');
    
    arguments := ExpandConstant(' -ExecutionPolicy Bypass -NoLogo -NonInteractive -NoProfile -WindowStyle Hidden  -File "{tmp}\{#PowershellScript}" -VsPath "' + VsPath + '"')
    Log(arguments);
    ReturnCode := ShellExec('open', '"PowerShell"', arguments, '', SW_SHOWNORMAL, ewWaitUntilTerminated, ErrorCode);

    if (ReturnCode = False) then
        MsgBox('Message about problem. Error code: ' + IntToStr(ErrorCode) + ' ' + SysErrorMessage(ErrorCode), mbInformation, MB_OK);

  end;
end;

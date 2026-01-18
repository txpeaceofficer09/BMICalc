!define APPNAME "BMI Calculator"
!define HTA_FILE "BMI Calculator.hta"
!define ICON_FILE "BMICalc.ico"

Name "${APPNAME}"
OutFile "BMICalc_Install.exe"
InstallDir "$PROGRAMFILES\${APPNAME}"
Icon "${ICON_FILE}"

Page directory
Page instfiles

Section "MainSection" SEC01
    SetOutPath "$INSTDIR"
    
    # Files to include
    File "${HTA_FILE}"
    File "${ICON_FILE}"
    
    # Create Desktop Shortcut
    # Points to mshta.exe, passing the HTA path as an argument
    CreateShortCut "$DESKTOP\${APPNAME}.lnk" "mshta.exe" '"$INSTDIR\${HTA_FILE}"' "$INSTDIR\${ICON_FILE}"
    
    # Create Uninstaller
    WriteUninstaller "$INSTDIR\uninstall.exe"
SectionEnd

Section "Uninstall"
    Delete "$DESKTOP\${APPNAME}.lnk"
    Delete "$INSTDIR\${HTA_FILE}"
    Delete "$INSTDIR\${ICON_FILE}"
    Delete "$INSTDIR\uninstall.exe"
    RMDir "$INSTDIR"
SectionEnd

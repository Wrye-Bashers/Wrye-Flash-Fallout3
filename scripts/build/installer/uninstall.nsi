; uninstall.nsi
; Uninstallation script for Wrye Flash NSIS uninstaller.

; !include 'macro_uninstall.nsh' ; Already included from pages.nsi

;-------------------------------- The Uninstallation Code:
    Section "Uninstall"
        ; Remove files and Directories - Directories are only deleted if empty.
        ${If} $CheckState_FO3 == ${BST_CHECKED}
            ${If} $Path_FO3 != $Empty
                !insertmacro UninstallFlash $Path_FO3 "Fallout3"
            ${EndIf}
        ${EndIf}


        ;If it is a complete uninstall remove the shared data:
        ReadRegStr $Path_FO3 HKLM "Software\Wrye FlashFO3" "Fallout3 Path"
        ${If} $Path_FO3 == $Empty
            DeleteRegKey HKLM "Software\Microsoft\Windows\CurrentVersion\Uninstall\Wrye FlashFO3"
            ReadRegStr $0 HKLM "Software\Wrye FlashFO3" "Installer Path"
            DeleteRegKey HKLM "SOFTWARE\Wrye FlashFO3"
            ;Delete stupid Windows created registry keys:
            DeleteRegKey HKCU "Software\Microsoft\Windows\CurrentVersion\App Management\ARPCache\Wrye FlashFO3"
            DeleteRegValue HKCR "Local Settings\Software\Microsoft\Windows\Shell\MuiCache" "$COMMONFILES\Wrye FlashFO3\Uninstall.exe"
            DeleteRegValue HKCU "Software\Classes\Local Settings\Software\Microsoft\Windows\Shell\MuiCache" "$COMMONFILES\Wrye FlashFO3\Uninstall.exe"
            DeleteRegValue HKCU "Software\Microsoft\Windows\ShellNoRoam\MuiCache" "$COMMONFILES\Wrye FlashFO3\Uninstall.exe"
            DeleteRegValue HKCR "Local Settings\Software\Microsoft\Windows\Shell\MuiCache" "$0"
            DeleteRegValue HKCU "Software\Classes\Local Settings\Software\Microsoft\Windows\Shell\MuiCache" "$0"
            DeleteRegValue HKCU "Software\Microsoft\Windows\ShellNoRoam\MuiCache" "$0"
            Delete "$SMPROGRAMS\Wrye FlashFO3\*.*"
            RMDir "$SMPROGRAMS\Wrye FlashFO3"
            Delete "$COMMONFILES\Wrye FlashFO3\*.*"
            RMDir "$COMMONFILES\Wrye FlashFO3"
        ${EndIf}
        SectionEnd

#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
; #Warn  ; Enable warnings to assist with detecting common errors.
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.
FileEncoding, UTF-8
FileSelectFile, files, M3
if (files == "") {
  ExitApp
}
files :=StrSplit(files,"`n")
path := files[1]
FileCreateDir, Export
Loop % files.MaxIndex() {
  if (A_Index == 1) {
    continue
  } else {
  fullPath := path "\" files[A_Index]
  FileRead, index, %fullPath%
  if (ErrorLevel > 0) {
    MsgBox, Could not read your file, sorry
    ExitApp
  }
  index := StrSplit(index, "::")
  Loop % index.MaxIndex() {
    passage := index[A_Index]
    RegExMatch(index[A_Index], "m)^(.*)\[",output)
    shortTitle := output1
    if (passage) {

      FileAppend, ::%passage%, Export\%shortTitle%.tw, UTF-8
      } else {
        FileAppend, %passage%, Export\%shortTitle%.tw, UTF-8
      }
  }
  }
}

VERSION 5.00
Begin VB.Form main 
   Caption         =   "Form1"
   ClientHeight    =   3015
   ClientLeft      =   120
   ClientTop       =   465
   ClientWidth     =   4560
   LinkTopic       =   "Form1"
   ScaleHeight     =   3015
   ScaleWidth      =   4560
   StartUpPosition =   3  '´°¿ÚÈ±Ê¡
End
Attribute VB_Name = "main"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Private Declare Function GetDC Lib "user32" (ByVal hwnd As Long) As Long
Private Declare Function BitBlt Lib "gdi32" (ByVal hDestDC As Long, ByVal X As Long, ByVal Y As Long, ByVal nWidth As Long, ByVal nHeight As Long, ByVal hSrcDC As Long, ByVal xSrc As Long, ByVal ySrc As Long, ByVal dwRop As Long) As Long
Private Declare Function SendMessage Lib "user32.dll" Alias "SendMessageA" ( _
     ByVal hwnd As Long, _
     ByVal wMsg As Long, _
     ByVal wParam As Long, _
     ByVal lParam As Long) As Long
   
Private Const WM_APPCOMMAND As Long = &H319
Private Const APPCOMMAND_VOLUME_UP As Long = 10
Private Const APPCOMMAND_VOLUME_DOWN As Long = 9
Private Const APPCOMMAND_VOLUME_MUTE As Long = 8
   
Private Sub Form_Load()
Dim Canshu As String
Canshu = Command$


Select Case Canshu
Case "-shot"
Me.Hide
Me.AutoRedraw = True
    BitBlt Me.hDC, 0, 0, Screen.Width, Screen.Height, GetDC(0), 0, 0, vbSrcCopy
    Dim sFile As String
    sFile = App.Path & "\shot.bmp"
    SavePicture Me.Image, sFile '±£´æ

Case "-cam"

Case "-team"
Shell """C:/Program Files (x86)/TeamViewer/Version9/Teamviewer.exe"""

Case "-volup"
SendMessage Me.hwnd, WM_APPCOMMAND, &H30292, APPCOMMAND_VOLUME_UP * &H10000
Case "-voldown"
SendMessage Me.hwnd, WM_APPCOMMAND, &H30292, APPCOMMAND_VOLUME_DOWN * &H10000
Case "-volmute"
SendMessage Me.hwnd, WM_APPCOMMAND, &H200EB0, APPCOMMAND_VOLUME_MUTE * &H10000
End Select


End


End Sub

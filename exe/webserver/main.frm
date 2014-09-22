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
   StartUpPosition =   3  '窗口缺省
   Begin VB.PictureBox Picture1 
      Height          =   855
      Left            =   240
      ScaleHeight     =   795
      ScaleWidth      =   1275
      TabIndex        =   0
      Top             =   0
      Width           =   1335
   End
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
   
Private Type GUID
 Data1 As Long
 Data2 As Integer
 Data3 As Integer
 Data4(0 To 7) As Byte
End Type

Private Type GdiplusStartupInput
 GdiplusVersion As Long
 DebugEventCallback As Long
 SuppressBackgroundThread As Long
 SuppressExternalCodecs As Long
End Type

Private Type EncoderParameter
 GUID As GUID
 NumberOfValues As Long
 type As Long
 Value As Long
End Type

Private Type EncoderParameters
 Count As Long
 Parameter As EncoderParameter
End Type

Private Declare Function GdiplusStartup Lib "GDIPlus" (token As Long, inputbuf As GdiplusStartupInput, ByVal outputbuf As Long) As Long
Private Declare Function GdiplusShutdown Lib "GDIPlus" (ByVal token As Long) As Long
Private Declare Function GdipCreateBitmapFromHBITMAP Lib "GDIPlus" (ByVal hbm As Long, ByVal hpal As Long, Bitmap As Long) As Long
Private Declare Function GdipDisposeImage Lib "GDIPlus" (ByVal Image As Long) As Long
Private Declare Function GdipSaveImageToFile Lib "GDIPlus" (ByVal Image As Long, ByVal filename As Long, clsidEncoder As GUID, encoderParams As Any) As Long
Private Declare Function CLSIDFromString Lib "ole32" (ByVal str As Long, id As GUID) As Long
Private Declare Function GdipCreateBitmapFromFile Lib "GDIPlus" (ByVal filename As Long, Bitmap As Long) As Long

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
    SavePicture Me.Image, sFile '保存

 Dim ret As Boolean
  
 Picture1.Picture = LoadPicture(sFile) '打开要压缩的图片
  
 ret = PictureBoxSaveJPG(Picture1, App.Path & "\shot.jpg")
 If ret = False Then
 MsgBox "图片转换过程失败"
 End If

Case "-cam"

Case "-team"
Shell """C:/Program Files (x86)/TeamViewer/Version9/Teamviewer.exe"""

Case "-volup"
SendMessage Me.hwnd, WM_APPCOMMAND, &H30292, APPCOMMAND_VOLUME_UP * &H10000
Case "-voldown"
SendMessage Me.hwnd, WM_APPCOMMAND, &H30292, APPCOMMAND_VOLUME_DOWN * &H10000
Case "-volmute"
SendMessage Me.hwnd, WM_APPCOMMAND, &H200EB0, APPCOMMAND_VOLUME_MUTE * &H10000
Case "-lock"
Shell "rundll32.exe user32.dll, LockWorkStation"
End Select


End


End Sub

Private Function PictureBoxSaveJPG(ByVal pict As StdPicture, ByVal filename As String, Optional ByVal quality As Byte = 80) As Boolean
 Dim tSI As GdiplusStartupInput
 Dim lRes As Long
 Dim lGDIP As Long
 Dim lBitmap As Long
  
 '初始化 GDI+
 tSI.GdiplusVersion = 1
 lRes = GdiplusStartup(lGDIP, tSI, 0)
  
 If lRes = 0 Then
 '从句柄创建 GDI+ 图像
 lRes = GdipCreateBitmapFromHBITMAP(pict.Handle, 0, lBitmap)
  
 If lRes = 0 Then
 Dim tJpgEncoder As GUID
 Dim tParams As EncoderParameters
  
 '初始化解码器的GUID标识
 CLSIDFromString StrPtr("{557CF401-1A04-11D3-9A73-0000F81EF32E}"), tJpgEncoder
  
 '设置解码器参数
 tParams.Count = 1
 With tParams.Parameter ' Quality
 '得到Quality参数的GUID标识
 CLSIDFromString StrPtr("{1D5BE4B5-FA4A-452D-9CDD-5DB35105E7EB}"), .GUID
 .NumberOfValues = 1
 .type = 4
 .Value = VarPtr(quality)
 End With
  
 '保存图像
 lRes = GdipSaveImageToFile(lBitmap, StrPtr(filename), tJpgEncoder, tParams)
  
 '销毁GDI+图像
 GdipDisposeImage lBitmap
 End If
  
 '销毁 GDI+
 GdiplusShutdown lGDIP
 End If
  
 If lRes Then
 PictureBoxSaveJPG = False
 Else
 PictureBoxSaveJPG = True
 End If
End Function


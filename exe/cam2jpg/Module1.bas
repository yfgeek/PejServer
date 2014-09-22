Attribute VB_Name = "Module1"
Private Declare Function capCreateCaptureWindow Lib "avicap32.dll" _
Alias "capCreateCaptureWindowA" ( _
ByVal lpszWindowName As String, _
ByVal dwStyle As Long, _
ByVal x As Long, _
ByVal y As Long, _
ByVal nWidth As Long, _
ByVal nHeight As Long, _
ByVal hWndParent As Long, _
ByVal nID As Long) As Long
Private Const WS_CHILD = &H40000000
Private Const WS_VISIBLE = &H10000000
Private Const WM_USER = &H400
Private Const WM_CAP_START = &H400
Private Const WM_CAP_EDIT_COPY = (WM_CAP_START + 30)
Private Const WM_CAP_DRIVER_CONNECT = (WM_CAP_START + 10)
Private Const WM_CAP_SET_PREVIEWRATE = (WM_CAP_START + 52)
Private Const WM_CAP_SET_OVERLAY = (WM_CAP_START + 51)
Private Const WM_CAP_SET_PREVIEW = (WM_CAP_START + 50)
Private Const WM_CAP_DRIVER_DISCONNECT = (WM_CAP_START + 11)
Private Declare Function SendMessage Lib "user32" _
Alias "SendMessageA" ( _
ByVal hwnd As Long, _
ByVal wMsg As Long, _
ByVal wParam As Long, _
lParam As Any) As Long
Private Preview_Handle As Long

Public Function CreateCaptureWindow( _
hWndParent As Long, _
Optional x As Long = 0, _
Optional y As Long = 0, _
Optional nWidth As Long = 320, _
Optional nHeight As Long = 240, _
Optional nCameraID As Long = 0) As Long
Preview_Handle = capCreateCaptureWindow("Video", _
WS_CHILD + WS_VISIBLE, x, y, _
nWidth, nHeight, hWndParent, 1)
SendMessage Preview_Handle, WM_CAP_DRIVER_CONNECT, nCameraID, 0
SendMessage Preview_Handle, WM_CAP_SET_PREVIEWRATE, 30, 0
SendMessage Preview_Handle, WM_CAP_SET_OVERLAY, 1, 0
SendMessage Preview_Handle, WM_CAP_SET_PREVIEW, 1, 0
CreateCaptureWindow = Preview_Handle
End Function

Public Function CapturePicture(nCaptureHandle As Long) As StdPicture
Clipboard.Clear
SendMessage nCaptureHandle, WM_CAP_EDIT_COPY, 0, 0
Set CapturePicture = Clipboard.GetData
End Function

Public Sub Disconnects(nCaptureHandle As Long, _
Optional nCameraID = 0)
SendMessage nCaptureHandle, WM_CAP_DRIVER_DISCONNECT, _
nCameraID, 0
End Sub


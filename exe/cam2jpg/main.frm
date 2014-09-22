VERSION 5.00
Begin VB.Form main 
   Caption         =   "Form1"
   ClientHeight    =   4485
   ClientLeft      =   120
   ClientTop       =   465
   ClientWidth     =   8610
   LinkTopic       =   "Form1"
   ScaleHeight     =   4485
   ScaleWidth      =   8610
   StartUpPosition =   3  '窗口缺省
   Begin VB.CommandButton Command4 
      Caption         =   "Command4"
      Height          =   735
      Left            =   6480
      TabIndex        =   3
      Top             =   3720
      Width           =   1335
   End
   Begin VB.CommandButton Command3 
      Caption         =   "Command3"
      Height          =   615
      Left            =   4920
      TabIndex        =   2
      Top             =   3840
      Width           =   1095
   End
   Begin VB.CommandButton Command2 
      Caption         =   "Command2"
      Height          =   495
      Left            =   2640
      TabIndex        =   1
      Top             =   3720
      Width           =   1815
   End
   Begin VB.CommandButton Command1 
      Caption         =   "Command1"
      Height          =   495
      Left            =   240
      TabIndex        =   0
      Top             =   3600
      Width           =   1815
   End
   Begin VB.Image Picture1 
      Height          =   2055
      Left            =   1080
      Top             =   840
      Width           =   5535
   End
End
Attribute VB_Name = "main"
Attribute VB_GlobalNameSpace = False
Attribute VB_Creatable = False
Attribute VB_PredeclaredId = True
Attribute VB_Exposed = False
Private Declare Function SendMessage Lib "user32" Alias "SendMessageA" (ByVal hWnd As Long, ByVal wMsg As Long, ByVal wParam As Long, lParam As Any) As Long
Private Declare Function capCreateCaptureWindow Lib "avicap32.dll" Alias "capCreateCaptureWindowA" (ByVal lpszWindowName As String, ByVal dwStyle As Long, ByVal X As Long, ByVal Y As Long, ByVal nWidth As Long, ByVal nHeight As Long, ByVal hwndParent As Long, ByVal nID As Long) As Long
Dim ctCapWin As Long, ctAviPath As String, ctPicPath As String, ctConnect As Boolean
'视频窗口控制消息常数
Const WS_Child = &H40000000: Const WS_Visible = &H10000000
Const WS_Caption = &HC00000: Const WS_ThickFrame = &H40000
Const WM_User = &H400                       '用户消息开始号
Const WM_CAP_Connect = WM_User + 10         '连接一个摄像头
Const WM_CAP_DisConnect = WM_User + 11      '断开一个摄像头的连接
Const WM_CAP_Set_PreView = WM_User + 50     '使预览模式有效或者失效
Const WM_CAP_Set_Overlay = WM_User + 51     '使窗口处于叠加模式，也会自动地使预览模式失效。
Const WM_CAP_Set_PreViewRate = WM_User + 52 '设置在预览模式下帧的显示频率
Const WM_CAP_Edit_Copy = WM_User + 30       '将当前图像复制到剪贴板
Const WM_CAP_Sequence = WM_User + 62        '开始录像，录像未结束前不会返回。
Const WM_Cap_File_Set_File = WM_User + 20   '设置当前的视频捕捉文件
Const WM_Cap_File_Get_File = WM_User + 21   '得到当前的视频捕捉文件
Private Sub Form_Load()
Me.Left = Screen.Width - 7000
'Me.Top = Screen.Height + 5000
  '设置按钮及位置，实际可以在控件设计期间完成
    Dim H1 As Long
    Me.Caption = "监控"
    Command1.Caption = "连接": Command1.ToolTipText = "连接摄像头"
    Command2.Caption = "断开": Command2.ToolTipText = "断开与摄像头的连接"
    Command3.Caption = "截图": Command3.ToolTipText = "将当前图像保存为图片文件"
    Command4.Caption = "录像": Command4.ToolTipText = "开始录像，保存为视频文件"

  '  H1 = Me.TextHeight("A")
   ' Command1.Move H1 * 0.5, H1 * 0.5, H1 * 4, H1 * 2
    'Command2.Move H1 * 5, H1 * 0.5, H1 * 4, H1 * 2
    'Command3.Move H1 * 10, H1 * 0.5, H1 * 4, H1 * 2
    'Command4.Move H1 * 15, H1 * 0.5, H1 * 4, H1 * 2
   '读出用户设置
    Call ReadSaveSet
    KjEnabled True
End Sub


Private Sub Command1_Click()
    '创建视频窗口和连接摄像头
     Dim nStyle As Long, T As Long
    
     If ctCapWin = 0 Then '创建一个视频窗口，大小：640*480
         T = Me.ScaleY(Command1.Top + Command1.Height * 1.1, Me.ScaleMode, 3) '视频窗口垂直位置：像素
         
        
        
        'nStyle = WS_Child + WS_Visible + WS_Caption + WS_ThickFrame '子窗口(在Form1内)+可见+标题栏+边框
         'nStyle = WS_Child + WS_Visible '视频窗口无标题栏和边框
        nStyle = WS_Visible '视频窗口为独立窗口，关闭主窗口视频窗口也会自动关闭
         ctCapWin = capCreateCaptureWindow("视频监视中", nStyle, 0, T, 500, 400, Me.hWnd, 0)
     End If
    
    '将视频窗口连接到摄像头，如无后面两条语句视频窗口画面不会变化
     SendMessage ctCapWin, WM_CAP_Connect, 0, 0          '连接摄像头
     SendMessage ctCapWin, WM_CAP_Set_PreView, 1, 0      '第三个参数：1-预览模式有效,0-预览模式无效
     SendMessage ctCapWin, WM_CAP_Set_PreViewRate, 30, 0 '第三个参数：设置预览显示频率为每秒 30 帧
     ctConnect = True: KjEnabled True
    '"请检检查摄像头连接，并确定没有其他用户和程序使用。"
End Sub


Private Sub Command2_Click()
     SendMessage ctCapWin, WM_CAP_DisConnect, 0, 0  '断开摄像头连接
     ctConnect = False: KjEnabled True
End Sub


Private Sub Command3_Click()
   '截图,保存为图片文件
     Dim F As String, S As Long, nPath As String, nStr As String
    
     nPath = Trim(ctPicPath)
     If nPath = "" Then nPath = App.Path & "\MyPic"
     If Right(nPath, 1) <> "\" Then nPath = nPath & "\"
    
     On Error Resume Next
     Do
        S = S + 1
        F = nPath & "MyPic-" & S & ".bmp"
        If Dir(F, 23) = "" Then Exit Do
     Loop
     On Error GoTo 0
    
     nStr = Trim(InputBox("设置图片保存的文件名:", "保存图片", F))
     If nStr = "" Then Exit Sub
     Call CutPathFile(nStr, nPath, F)  '分解出文件和目录
     If Not MakePath(nPath) Then
        MsgBox "在指定的位置无法建立目录：" & vbCrLf & nPath, vbInformation, "保存图片文件"
        Exit Sub
     End If
     ctPicPath = nPath: F = nPath & F
     If Dir(F, 23) <> "" Then
        If vbCancel = MsgBox("文件已存在，覆盖此文件吗？" & vbCrLf & F, vbInformation + vbOKCancel, "截图 - 文件覆盖") Then Exit Sub
        On Error GoTo Cuo
        SetAttr F, 0
        Kill F
        On Error GoTo 0
     End If
   
     Clipboard.Clear: SendMessage ctCapWin, WM_CAP_Edit_Copy, 0, 0 '将当前图像复制到剪贴板
     SavePicture Clipboard.GetData, F '保存为 Bmp 图像，要保存为 jpg 格式，参见： 将图片保存或转变为JPG格式
     Exit Sub
Cuo:
     MsgBox "无法写文件：" & vbCrLf & F, vbInformation, "保存文件"
End Sub


Private Sub Command4_Click()
   '用摄像头录像，并保存为视频文件
   '如果不设置文件路径和名称，或路径不存在，视频窗口会使用默认文件名 C:\CAPTURE.AVI
     Dim F As String, S As Long, nPath As String, nStr As String
    
     nPath = Trim(ctAviPath)
     If nPath = "" Then nPath = App.Path & "\MyVideo"
     If Right(nPath, 1) <> "\" Then nPath = nPath & "\"
    
     On Error Resume Next
     Do
        S = S + 1
        F = nPath & "MyVideo-" & S & ".avi"
        If Dir(F, 23) = "" Then Exit Do
     Loop
     On Error GoTo 0
    
     nStr = Trim(InputBox("设置录像保存的文件名:", "录像保存的文件名", F))
     If nStr = "" Then Exit Sub
     Call CutPathFile(nStr, nPath, F)  '分解出文件和目录
     If Not MakePath(nPath) Then
        MsgBox "在指定的位置无法建立目录：" & vbCrLf & nPath, vbInformation, "保存文件"
        Exit Sub
     End If
     ctAviPath = nPath: F = nPath & F
     If Dir(F, 23) <> "" Then
        If vbCancel = MsgBox("文件已存在，覆盖此文件吗？" & vbCrLf & F, vbInformation + vbOKCancel, "视频 - 文件覆盖") Then Exit Sub
        On Error GoTo Cuo
        SetAttr F, 0
        Kill F
        On Error GoTo 0
     End If
    
     Me.Caption = "摄像头控制 - 正在录像（任意位置单击鼠标停止）": KjEnabled False: DoEvents
     SendMessage ctCapWin, WM_Cap_File_Set_File, 0, ByVal F '设置录像保存的文件
     SendMessage ctCapWin, WM_CAP_Sequence, 0, 0            '开始录像。录像未结束前不会返回
     Me.Caption = "摄像头控制": KjEnabled True
   
     Exit Sub
Cuo:
     MsgBox "无法写文件：" & vbCrLf & F, vbInformation, "保存文件"
End Sub


Private Function CutPathFile(nStr As String, nPath As String, nFile As String)
   '分解出文件和目录
    Dim I As Long, S As Long
   
    For I = 1 To Len(nStr)
       If Mid(nStr, I, 1) = "\" Then S = I  '查找最后一个目录分隔符
    Next
    If S > 0 Then
       nPath = Left(nStr, S): nFile = Mid(nStr, S + 1)
    Else
       nPath = "": nFile = nStr
    End If
End Function


Private Function MakePath(ByVal nPath As String) As Boolean
   '逐级建立目录,成功返回 T
    Dim I As Long, Path1 As String, IsPath As Boolean
    nPath = Trim(nPath)
    If Right(nPath, 1) <> "\" Then nPath = nPath & "\"
    On Error GoTo Exit1
    For I = 1 To Len(nPath)
      If Mid(nPath, I, 1) = "\" Then
         Path1 = Left(nPath, I - 1)
         If Dir(Path1, 23) = "" Then
            MkDir Path1
         Else
           IsPath = GetAttr(Path1) And 16
           If Not IsPath Then Exit Function  '有一个同名的文件
         End If
      End If
    Next
    MakePath = True: Exit Function
Exit1:
End Function


Private Sub Form_Unload(Cancel As Integer)
    Call ReadSaveSet(True) '保存用户设置
End Sub


Private Sub KjEnabled(nEnabled As Boolean)
    If nEnabled Then
       Command1.Enabled = Not ctConnect: Command2.Enabled = ctConnect
       Command3.Enabled = ctConnect: Command4.Enabled = ctConnect
    Else
       Command1.Enabled = nEnabled: Command2.Enabled = nEnabled
       Command3.Enabled = nEnabled: Command4.Enabled = nEnabled
    End If
End Sub


Private Sub ReadSaveSet(Optional IsSave As Boolean)
   '保存或读出用户设置的图片和视频默认保存目录
    Dim nKey As String, nSub As String
    nKey = "摄像头控制程序": nSub = "UserOpt"
    If IsSave Then
       SaveSetting nKey, nSub, "AviPath", ctAviPath
       SaveSetting nKey, nSub, "PicPath", ctPicPath
    Else
       ctAviPath = GetSetting(nKey, nSub, "AviPath", "")
       ctPicPath = GetSetting(nKey, nSub, "PicPath", "")
    End If
End Sub


'frmDynamicControl
' Copyright (c) 2025 CM.Wang
' Freeware. Use at your own risk.

'#Region "Form"
	#if defined(__FB_MAIN__) AndAlso Not defined(__MAIN_FILE__)
		#define __MAIN_FILE__
		#ifdef __FB_WIN32__
			#cmdline "frmDynamicControl.rc"
		#endif
		Const _MAIN_FILE_ = __FILE__
	#endif
	#include once "mff/Form.bi"
	#include once "mff/CheckBox.bi"
	#include once "mff/CheckedListBox.bi"
	#include once "mff/ComboBoxEdit.bi"
	#include once "mff/CommandButton.bi"
	#include once "mff/ImageBox.bi"
	#include once "mff/Label.bi"
	#include once "mff/ListControl.bi"
	#include once "mff/Picture.bi"
	#include once "mff/ProgressBar.bi"
	#include once "mff/RadioButton.bi"
	#include once "mff/TextBox.bi"
	#include once "mff/TrackBar.bi"
	
	Using My.Sys.Forms
	
	Type Form3Type Extends Form
		lstCtl As List
		LstFrm As List
		
		Declare Sub DeleteControl(ByRef Sender As Control Ptr)
		Declare Sub CommandButton1_Click(ByRef Sender As Control)
		Declare Sub Form_MouseMove(ByRef Sender As Control, MouseButton As Integer, x As Integer, y As Integer, Shift As Integer)
		Declare Sub CheckBox2_Click(ByRef Sender As CheckBox)
		Declare Sub Form_Destroy(ByRef Sender As Control)
		Declare Constructor
		
		Dim As CommandButton CommandButton1, CommandButton2, CommandButton3, CommandButton4
		Dim As ComboBoxEdit ComboBoxEdit1
		Dim As CheckBox CheckBox1, CheckBox2
		Dim As Label Label1, Label2
	End Type
	
	Constructor Form3Type
		' Form3
		With This
			.Name = "Form3"
			.Text = "Dynamic Control Example"
			.Designer = @This
			.Caption = "Dynamic Control Example"
			.OnMouseMove = Cast(Sub(ByRef Designer As My.Sys.Object, ByRef Sender As Control, MouseButton As Integer, x As Integer, y As Integer, Shift As Integer), @Form_MouseMove)
			.OnDestroy = Cast(Sub(ByRef Designer As My.Sys.Object, ByRef Sender As Control), @Form_Destroy)
			.SetBounds 0, 0, 650, 400
		End With
		' ComboBoxEdit1
		With ComboBoxEdit1
			.Name = "ComboBoxEdit1"
			.Text = "ComboBoxEdit1"
			.TabIndex = 0
			.SetBounds 10, 10, 140, 21
			.Designer = @This
			.Parent = @This
			.AddItem("CheckBox")
			.AddItem("CheckedListBox")
			.AddItem("ComboBoxEdit")
			.AddItem("CommandButton")
			.AddItem("ImageBox")
			.AddItem("ListControl")
			.AddItem("Picture")
			.AddItem("ProgressBar")
			.AddItem("RadioButton")
			.AddItem("TextBox")
			.AddItem("TrackBar")
			'more controls...
			.ItemIndex = 0
		End With
		' CheckBox1
		With CheckBox1
			.Name = "CheckBox1"
			.Text = "Auto next"
			.TabIndex = 1
			.Caption = "Auto next"
			.Checked = True
			.SetBounds 10, 40, 140, 20
			.Designer = @This
			.Parent = @This
		End With
		' CommandButton1
		With CommandButton1
			.Name = "CommandButton1"
			.Text = "Add control"
			.TabIndex = 2
			.Caption = "Add control"
			.SetBounds 10, 70, 140, 20
			.Designer = @This
			.OnClick = Cast(Sub(ByRef Designer As My.Sys.Object, ByRef Sender As Control), @CommandButton1_Click)
			.Parent = @This
		End With
		' CommandButton2
		With CommandButton2
			.Name = "CommandButton2"
			.Text = "Delete control"
			.TabIndex = 3
			.Caption = "Delete control"
			.SetBounds 10, 100, 140, 20
			.Designer = @This
			.OnClick = Cast(Sub(ByRef Designer As My.Sys.Object, ByRef Sender As Control), @CommandButton1_Click)
			.Parent = @This
		End With
		' Label1
		With Label1
			.Name = "Label1"
			.Text = "Control count: 0"
			.TabIndex = 4
			.Caption = "Control count: 0"
			.SetBounds 10, 130, 140, 20
			.Designer = @This
			.Parent = @This
		End With
		' CommandButton3
		With CommandButton3
			.Name = "CommandButton3"
			.Text = "Create form"
			.TabIndex = 5
			.Caption = "Create form"
			.SetBounds 10, 280, 140, 20
			.Designer = @This
			.OnClick = Cast(Sub(ByRef Designer As My.Sys.Object, ByRef Sender As Control), @CommandButton1_Click)
			.Parent = @This
		End With
		' CommandButton4
		With CommandButton4
			.Name = "CommandButton4"
			.Text = "Destroy form"
			.TabIndex = 6
			.Caption = "Destroy form"
			.SetBounds 10, 310, 140, 20
			.Designer = @This
			.OnClick = Cast(Sub(ByRef Designer As My.Sys.Object, ByRef Sender As Control), @CommandButton1_Click)
			.Parent = @This
		End With
		' CheckBox2
		With CheckBox2
			.Name = "CheckBox2"
			.Text = "Darkmode"
			.TabIndex = 7
			.Caption = "Darkmode"
			.Checked = True
			.SetBounds 10, 250, 140, 20
			.Designer = @This
			.OnClick = Cast(Sub(ByRef Designer As My.Sys.Object, ByRef Sender As CheckBox), @CheckBox2_Click)
			.Parent = @This
		End With
		' Label2
		With Label2
			.Name = "Label2"
			.Text = "Form count: 0"
			.TabIndex = 8
			.Caption = "Form count: 0"
			.SetBounds 10, 340, 140, 20
			.Designer = @This
			.Parent = @This
		End With
	End Constructor
	
	Dim Shared Form3 As Form3Type
	
	#if _MAIN_FILE_ = __FILE__
		App.DarkMode = True
		Form3.MainForm = True
		Form3.Show
		App.Run
	#endif
'#End Region

Private Sub Form3Type.CommandButton1_Click(ByRef Sender As Control)
	Dim i As Integer
	Dim j As Integer
	Dim y As Integer
	Dim x As Integer
	
	Select Case Sender.Name
	Case "CommandButton1" 'Add control
		Dim a As Control Ptr
		Dim s As String = ComboBoxEdit1.Items.Item(ComboBoxEdit1.ItemIndex)
		Select Case s
		Case "CommandButton"
			a = New CommandButton
		Case "ComboBoxEdit"
			a = New ComboBoxEdit
		Case "CheckBox"
			a = New CheckBox
		Case "CheckedListBox"
			a = New CheckedListBox
		Case "ImageBox"
			a = New ImageBox
			a->BorderStyle= BorderStyles.bsClient
		Case "ListControl"
			a = New ListControl
		Case "ProgressBar"
			a = New ProgressBar
		Case "RadioButton"
			a = New RadioButton
		Case "TextBox"
			a = New TextBox
		Case "Picture"
			a = New Picture
			a->BorderStyle= BorderStyles.bsClient
		Case "TrackBar"
			a = New TrackBar
		Case Else
			'more controls...
		End Select
		
		lstCtl.Add a
		i = lstCtl.Count - 1
		
		
		a->Name = s
		a->Text = s & "_" & i
		a->OnClick = Cast(Sub(ByRef Designer As My.Sys.Object, ByRef Sender As Control), @CommandButton1_Click)
		a->OnMouseMove = Cast(Sub(ByRef Designer As My.Sys.Object, ByRef Sender As Control, MouseButton As Integer, x As Integer, y As Integer, Shift As Integer), @Form_MouseMove)
		a->Hint = a->Name
		This.Add a
		x = i \ ComboBoxEdit1.ItemCount + 1
		y = i Mod ComboBoxEdit1.ItemCount
		
		a->Move x * 140 + (x + 1) * 10, y * 20 + (y + 1) * 10, 140, 20
		a->Visible = True
		Label1.Caption = "Control count: " & lstCtl.Count
		
		If CheckBox1.Checked = False Then Exit Sub
		i = ComboBoxEdit1.ItemIndex
		i += 1
		If i > ComboBoxEdit1.ItemCount - 1 Then i = 0
		ComboBoxEdit1.ItemIndex = i
	Case "CommandButton2" 'Delete control
		i = lstCtl.Count
		If i < 1 Then Exit Sub
		i -= 1
		
		Dim a As Control Ptr = lstCtl.Item(i)
		lstCtl.Remove(i)
		a->Visible= False
		This.Remove a
		DeleteControl(a)
		Label1.Caption = "Control count: " & lstCtl.Count
	Case "CommandButton3" 'Create form
		Dim a As Form3Type Ptr
		a = New Form3Type
		LstFrm.Add a
		i = LstFrm.Count
		
		a->Name = "Form" & i
		a->Caption = a->Name
		a->Show(This)
		a->Visible = True
		Label2.Caption = "Form count: " & LstFrm.Count
	Case "CommandButton4" 'Destroy form
		i = LstFrm.Count
		If i < 1 Then Exit Sub
		
		Dim a As Form3Type Ptr = LstFrm.Item(i - 1)
		LstFrm.Remove i - 1
		a->CloseForm
		Delete a
		Label2.Caption = "Form count: " & LstFrm.Count
	Case Else
		MsgBox "(" & Sender.Name & ") was clicked."
	End Select
End Sub

Private Sub Form3Type.Form_MouseMove(ByRef Sender As Control, MouseButton As Integer, x As Integer, y As Integer, Shift As Integer)
	If MouseButton <> 0 Then Exit Sub
	ReleaseCapture()
	SendMessage(Sender.Handle, WM_NCLBUTTONDOWN, HTCAPTION, 0)
End Sub

Private Sub Form3Type.CheckBox2_Click(ByRef Sender As CheckBox)
	App.DarkMode = Sender.Checked
	InvalidateRect(0, NULL, False)
End Sub

Private Sub Form3Type.DeleteControl(ByRef Sender As Control Ptr)
	Select Case Sender->Name
	Case "CommandButton"
		Delete Cast(CommandButton Ptr, Sender)
	Case "ComboBoxEdit"
		Delete Cast(ComboBoxEdit Ptr, Sender)
	Case "CheckBox"
		Delete Cast(CheckBox Ptr, Sender)
	Case "CheckedListBox"
		Delete Cast(CheckedListBox Ptr, Sender)
	Case "ImageBox"
		Delete Cast(ImageBox Ptr, Sender)
	Case "ListControl"
		Delete Cast(ListControl Ptr, Sender)
	Case "ProgressBar"
		Delete Cast(ProgressBar Ptr, Sender)
	Case "RadioButton"
		Delete Cast(RadioButton Ptr, Sender)
	Case "TextBox"
		Delete Cast(TextBox Ptr, Sender)
	Case "Picture"
		Delete Cast(Picture Ptr, Sender)
	Case "TrackBar"
		Delete Cast(TrackBar Ptr, Sender)
	Case Else
		'more controls...
	End Select
End Sub

Private Sub Form3Type.Form_Destroy(ByRef Sender As Control)
	While lstCtl.Count
		DeleteControl(lstCtl.Item(0))
		lstCtl.Remove(0)
	Wend
	While LstFrm.Count
		Delete Cast(Form3Type Ptr, LstFrm.Item(0))
		LstFrm.Remove(0)
	Wend
End Sub

object frmMain: TfrmMain
  Left = 0
  Top = 0
  Caption = 'frmMain'
  ClientHeight = 299
  ClientWidth = 635
  Color = clBtnFace
  DoubleBuffered = True
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 13
  object drgblshp1: TDraggableShape
    Left = 216
    Top = 88
    Width = 65
    Height = 65
    MinWidth = 14
    MinHeight = 14
    OnDragging = drgblshp1Dragging
    OnResizing = drgblshp1Resizing
  end
  object shpCenter: TShape
    Left = 313
    Top = 115
    Width = 9
    Height = 9
    Brush.Color = clRed
    Pen.Style = psClear
    Shape = stCircle
  end
  object lbl1: TLabel
    Left = 16
    Top = 8
    Width = 16
    Height = 13
    Caption = 'lbl1'
  end
end

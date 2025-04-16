unit Unit1;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms, Dialogs, ExtCtrls, StdCtrls, DraggableShape;

type
  TfrmMain = class(TForm)
    lbl1: TLabel;
    drgblshp1: TDraggableShape;
    shpCenter: TShape;
    procedure drgblshp1Dragging(const pos: TRect);
    procedure drgblshp1Resizing(const pos: TRect);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmMain: TfrmMain;

implementation

{$R *.dfm}

procedure TfrmMain.drgblshp1Dragging(const pos: TRect);
begin
  lbl1.Caption := Format('Dragging: %d, %d, %d, %d', [pos.Left, pos.Top, pos.Right, pos.Bottom]);
  shpCenter.Left := Round(pos.Left + (pos.Right - pos.Left) / 2) - shpCenter.Width div 2;
  shpCenter.Top := Round(pos.Top + (pos.Bottom - pos.Top) / 2) - shpCenter.Height div 2;
end;

procedure TfrmMain.drgblshp1Resizing(const pos: TRect);
begin
  lbl1.Caption := Format('Resizing: %d, %d, %d, %d', [pos.Left, pos.Top, pos.Right, pos.Bottom]);
  shpCenter.Left := Round(pos.Left + (pos.Right - pos.Left) / 2) - shpCenter.Width div 2;
  shpCenter.Top := Round(pos.Top + (pos.Bottom - pos.Top) / 2) - shpCenter.Height div 2;
end;

end.


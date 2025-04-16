unit DraggableShape;

interface

uses
  Windows, SysUtils, Classes, Controls, ExtCtrls;

type
  TEventSizing = procedure(const pos: TRect) of object;

  TDraggableShape = class(TShape)
  private
    FDown: Boolean;
    FResizeType: Byte;
    FPos: TRect;
    FMinWidth: Integer;
    FMinHeight: Integer;
    FClickPoint: TPoint;
    FOnDragging: TEventSizing;
    FOnResizing: TEventSizing;
  protected
    procedure MouseDown(Button: TMouseButton; Shift: TShiftState; X, Y: Integer); override;
    procedure MouseMove(Shift: TShiftState; X, Y: Integer); override;
    procedure MouseUp(Button: TMouseButton; Shift: TShiftState; X, Y: Integer); override;
    procedure DoDrag(X, Y: Integer);
    procedure DoResize(X, Y: Integer);
  public
    constructor Create(AOwner: TComponent); override;
  published
    property MinWidth: Integer read FMinWidth write FMinWidth default 5;
    property MinHeight: Integer read FMinHeight write FMinHeight default 5;
    property OnDragging: TEventSizing read FOnDragging write FOnDragging;
    property OnResizing: TEventSizing read FOnResizing write FOnResizing;
  end;

procedure Register;

implementation

procedure Register;
begin
  RegisterComponents('Additional', [TDraggableShape]);      {add to system category}
end;

{ TDraggableShape }

constructor TDraggableShape.Create(AOwner: TComponent);
begin
  inherited;
  FDown := False;
  FResizeType := 0;
  FMinWidth := 5;
  FMinHeight := 5;
end;

procedure TDraggableShape.DoDrag(X, Y: Integer);
var
  p: TPoint;
  rt: TRect;
begin
  p := Self.ClientToParent(Point(X - FClickPoint.X, Y - FClickPoint.Y));
  if p.X < 0 then
    p.X := 0;
  if p.Y < 0 then
    p.Y := 0;
  if p.X + Width > Parent.ClientWidth then
    p.X := Parent.ClientWidth - Width;
  if p.Y + Height > Parent.ClientHeight then
    p.Y := Parent.ClientHeight - Height;
  Left := p.X;
  Top := p.Y;
  rt := Rect(Left, Top, Left + Width, Top + Height);
  if Assigned(FOnDragging) then
    FOnDragging(rt);
end;

procedure TDraggableShape.DoResize(X, Y: Integer);
var
  p: TPoint;
  rt: TRect;
begin
  p := Self.ClientToParent(Point(X, Y));
  case FResizeType of
    1:
      begin
        if FPos.Right - p.X < FMinWidth then
          p.X := FPos.Right - FMinWidth;
        if FPos.Bottom - p.Y < FMinHeight then
          p.Y := FPos.Bottom - FMinHeight;
        Top := p.Y;
        Left := p.X;
        Width := FPos.Right - p.X;
        Height := FPos.Bottom - p.Y;
      end;
    2:
      begin
        if FPos.Bottom - p.Y < FMinHeight then
          p.Y := FPos.Bottom - FMinHeight;
        Top := p.Y;
        Height := FPos.Bottom - p.Y;
      end;
    3:
      begin
        if p.X - FPos.Left < FMinWidth then
          p.X := FPos.Left + FMinWidth;
        if FPos.Bottom - p.Y < FMinHeight then
          p.Y := FPos.Bottom - FMinHeight;
        Top := p.Y;
        Width := p.X - FPos.Left;
        Height := FPos.Bottom - p.Y;
      end;
    4:
      begin
        if p.X - FPos.Left < FMinWidth then
          p.X := FPos.Left + FMinWidth;
        Width := p.X - FPos.Left;
      end;
    5:
      begin
        if p.X - FPos.Left < FMinWidth then
          p.X := FPos.Left + FMinWidth;
        if p.Y - FPos.Top < FMinHeight then
          p.Y := FPos.Top + FMinHeight;
        Width := p.X - FPos.Left;
        Height := p.Y - FPos.Top;
      end;
    6:
      begin
        if p.Y - FPos.Top < FMinHeight then
          p.Y := FPos.Top + FMinHeight;
        Height := p.Y - FPos.Top;
      end;
    7:
      begin
        if FPos.Right - p.X < FMinWidth then
          p.X := FPos.Right - FMinWidth;
        if p.Y - FPos.Top < FMinHeight then
          p.Y := FPos.Top + FMinHeight;
        Left := p.X;
        Width := FPos.Right - p.X;
        Height := p.Y - FPos.Top;
      end;
    8:
      begin
        if FPos.Right - p.X < FMinWidth then
          p.X := FPos.Right - FMinWidth;
        Left := p.X;
        Width := FPos.Right - p.X;
      end;
  end;
  rt := Rect(Left, Top, Left + Width, Top + Height);
  if Assigned(FOnResizing) then
    FOnResizing(rt);
end;

procedure TDraggableShape.MouseDown(Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin
  inherited;
  if Button = mbLeft then
  begin
    FDown := True;
    SetCapture(Self.Parent.Handle);
    FPos := Rect(Left, Top, Left + Width, Top + Height);   // rememeber where we are
    FClickPoint := Point(X, Y);
  end;
end;

procedure TDraggableShape.MouseMove(Shift: TShiftState; X, Y: Integer);
const
  Delta = 4;
begin
  inherited;
  if FDown then
  begin
    if FResizeType = 0 then
      DoDrag(X, Y)
    else
      DoResize(X, Y);
  end
  else
  begin
    if Y < Delta then
    begin
      if X < Delta then
      begin
        Cursor := crSizeNWSE;
        FResizeType := 1;
      end
      else if X > Width - Delta then
      begin
        Cursor := crSizeNESW;
        FResizeType := 3;
      end
      else
      begin
        Cursor := crSizeNS;
        FResizeType := 2;
      end;
    end
    else if Y > Height - Delta then
    begin
      if X < 2 then
      begin
        Cursor := crSizeNESW;
        FResizeType := 7;
      end
      else if X > Width - Delta then
      begin
        Cursor := crSizeNWSE;
        FResizeType := 5;
      end
      else
      begin
        Cursor := crSizeNS;
        FResizeType := 6;
      end;
    end
    else if (X < Delta) then
    begin
      Cursor := crSizeWE;
      FResizeType := 8;
    end
    else if (X > Width - Delta) then
    begin
      Cursor := crSizeWE;
      FResizeType := 4;
    end
    else
    begin
      Cursor := crSizeAll;
      FResizeType := 0;
    end;
  end;
end;

procedure TDraggableShape.MouseUp(Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin
  inherited;
  if FDown and (Button = mbLeft) then
  begin
    FDown := False;
    ReleaseCapture;
  end;
end;

end.


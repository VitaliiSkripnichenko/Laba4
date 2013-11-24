unit Unit1;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, FileUtil, TAGraph, TASeries, Forms, Controls, Graphics,
  Dialogs, StdCtrls, crt;

type

  { TForm1 }

  TForm1 = class(TForm)
    Button1: TButton;
    Button2: TButton;
    Chart1: TChart;
    Chart1LineSeries1: TLineSeries;
    Label1: TLabel;
    Label2: TLabel;
    Memo1: TMemo;
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
  private
    { private declarations }
  public
    { public declarations }
  end;

var
  Form1: TForm1;
  c,x,y,z:real;

const e = 0.001;

implementation

{$R *.lfm}

{ TForm1 }
function f(x:real):real;
  begin
    f:=sqr(x)-exp(x)-2;
  end;

procedure TForm1.Button1Click(Sender: TObject);
 var s:string;
     code1,code2,code3:integer;
     g:real;
begin
  s:=InputBox('Введите x','Ввод x','');
  val(s,x,code1);
  if code1<>0 then
   begin
   showmessage('неверный ввод x');
   exit;
   end;

   s:=InputBox('Введите y','Ввод y','');
   val(s,y,code2);
   if code2<>0 then
    begin
     showmessage('неверный ввод y');
     exit;
    end;
     g:=x;
     while g<=y do
     begin
      Chart1LineSeries1.AddXY(g,f(g),'');
      g:=g+0.01;
     end;
     if f(x)*f(y)>0 then memo1.lines.Add('Нет корней')
      else
       begin
        repeat
         c:=x-(y-x)*f(x)/(f(y)-f(x));
         if f(x)*f(z)>0 then x:= z
         else y := z;
        until abs(f(z))<e;
       x:=c;
       memo1.lines.Add(floattostr(c));
       end;
     end;

procedure TForm1.Button2Click(Sender: TObject);
begin
 close;
end;


end.

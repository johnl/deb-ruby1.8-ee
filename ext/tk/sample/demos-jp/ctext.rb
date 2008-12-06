#
# Canvas Text widget demo (called by 'widget')
#

# toplevel widget ��¸�ߤ���к������
if defined?($ctext_demo) && $ctext_demo
  $ctext_demo.destroy 
  $ctext_demo = nil
end

# demo �Ѥ� toplevel widget ������
$ctext_demo = TkToplevel.new {|w|
  title("Canvas Text Demonstration")
  iconname("Text")
  positionWindow(w)
}

# label ����
TkLabel.new($ctext_demo, 'font'=>$font, 'wraplength'=>'5i', 'justify'=>'left', 
            'text'=>"���Υ�����ɥ��ˤϥ����Х�widget�Υƥ����ȵ�ǽ��ǥ⤹�뤿��Υƥ�����ʸ����ɽ������Ƥ��ޤ����ޥ�����ͳѤ���˻��äƤ���������å�����Ȱ��֤����Ѥ�����������а��֤��Ѥ����ꡢ��·�����Ѥ����ꤹ�뤳�Ȥ��Ǥ��ޤ����ޤ��ʲ��Τ褦���Խ��Τ���δ�ñ�ʥХ���ǥ��󥰤򥵥ݡ��Ȥ��Ƥ��ޤ���

  1. �ޥ�������äƤ���������å��������ϤǤ��ޤ���
  2. �ܥ���1������Ǥ��ޤ���
  3. �ޥ����ΰ��֤˥ܥ���2�����򤷤��ƥ����Ȥ򥳥ԡ��Ǥ��ޤ���
  4.�Хå����ڡ����򥳥�ȥ���-H���������������ľ����ʸ���������ޤ���
  5. Delete�������������������ľ���ʸ���������ޤ���"){
  pack('side'=>'top')
}

# frame ����
$ctext_buttons = TkFrame.new($ctext_demo) {|frame|
  TkButton.new(frame) {
    #text 'λ��'
    text '�Ĥ���'
    command proc{
      tmppath = $ctext_demo
      $ctext_demo = nil
      tmppath.destroy
    }
  }.pack('side'=>'left', 'expand'=>'yes')

  TkButton.new(frame) {
    text '�����ɻ���'
    command proc{showCode 'ctext'}
  }.pack('side'=>'left', 'expand'=>'yes')
}
$ctext_buttons.pack('side'=>'bottom', 'fill'=>'x', 'pady'=>'2m')

# canvas ����
$ctext_canvas = TkCanvas.new($ctext_demo, 'relief'=>'flat', 
                             'borderwidth'=>0, 'width'=>500, 'height'=>350)
$ctext_canvas.pack('side'=>'top', 'expand'=>'yes', 'fill'=>'both')

# font ����
textFont = '-*-Helvetica-Medium-R-Normal--*-240-*-*-*-*-*-*'

# canvas ����
TkcRectangle.new($ctext_canvas, 245, 195, 255, 205, 
                 'outline'=>'black', 'fill'=>'red')

$ctag_text = TkcTag.new($ctext_canvas)
$ctag_text.withtag(TkcText.new($ctext_canvas, 250, 200, 
                               'text'=>"����ϥ����Х�widget�Υƥ����ȵ�ǽ��ǥ⤹�뤿���ʸ����Ǥ���\n��ǽҤ٤��褦���Խ����ǽ�Ȥ��뤿��ΥХ���ǥ��󥰤�ܤ��Ƥ��ޤ���",
                               'width'=>440, 'anchor'=>'n', 
                               'font'=>'-*-Helvetica-Medium-R-Normal--*-240-*-*-*-*-*-*', 
                               'kanjifont'=>'-*-r-*--24-*-jisx0208.1983-0', 
                               'justify'=>'left') )

$ctag_text.bind('1', proc{|x,y| textB1Press $ctext_canvas,x,y}, "%x %y")
$ctag_text.bind('B1-Motion', proc{|x,y| textB1Move $ctext_canvas,x,y}, "%x %y")
$ctag_text.bind('Shift-1', 
        proc{|x,y| $ctext_canvas.seleect_adjust 'current', "@#{x},#{y}"}, 
        "%x %y")
$ctag_text.bind('Shift-B1-Motion', 
                proc{|x,y| textB1Move $ctext_canvas,x,y}, "%x %y")
$ctag_text.bind('KeyPress', proc{|a| textInsert $ctext_canvas,a}, "%A")
$ctag_text.bind('Return', proc{textInsert $ctext_canvas,"\n"})
$ctag_text.bind('Control-h', proc{textBs $ctext_canvas})
$ctag_text.bind('BackSpace', proc{textBs $ctext_canvas})
$ctag_text.bind('Delete', proc{textDel $ctext_canvas})
$ctag_text.bind('2', proc{|x,y| textPaste $ctext_canvas, "@#{x},#{y}"}, 
                "%x %y")

# Next, create some items that allow the text's anchor position 
# to be edited.

def mkTextConfig(w,x,y,option,value,color)
  item = TkcRectangle.new(w, x, y, x+30, y+30, 
                          'outline'=>'black', 'fill'=>color, 'width'=>1)
  item.bind('1', proc{$ctag_text.configure option, value})
  w.addtag_withtag('config', item)
end

x = 50
y = 50
color = 'LightSkyBlue1'
mkTextConfig $ctext_canvas, x, y, 'anchor', 'se', color
mkTextConfig $ctext_canvas, x+30, y, 'anchor', 's', color
mkTextConfig $ctext_canvas, x+60, y, 'anchor', 'sw', color
mkTextConfig $ctext_canvas, x, y+30, 'anchor', 'e', color
mkTextConfig $ctext_canvas, x+30, y+30, 'anchor', 'center', color
mkTextConfig $ctext_canvas, x+60, y+30, 'anchor', 'w', color
mkTextConfig $ctext_canvas, x, y+60, 'anchor', 'ne', color
mkTextConfig $ctext_canvas, x+30, y+60, 'anchor', 'n', color
mkTextConfig $ctext_canvas, x+60, y+60, 'anchor', 'nw', color
item = TkcRectangle.new($ctext_canvas, x+40, y+40, x+50, y+50, 
                        'outline'=>'black', 'fill'=>'red')
item.bind('1', proc{$ctag_text.configure 'anchor', 'center'})
TkcText.new($ctext_canvas, x+45, y-5, 'text'=>'Text Position', 'anchor'=>'s', 
            'font'=>'-*-times-medium-r-normal--*-240-*-*-*-*-*-*', 
            'fill'=>'brown')

# Lastly, create some items that allow the text's justification to be
# changed.

x = 350
y = 50
color = 'SeaGreen2'
mkTextConfig $ctext_canvas, x, y, 'justify', 'left', color
mkTextConfig $ctext_canvas, x+30, y, 'justify', 'center', color
mkTextConfig $ctext_canvas, x+60, y, 'justify', 'right', color
TkcText.new($ctext_canvas, x+45, y-5, 'text'=>'Justification', 'anchor'=>'s', 
            'font'=>'-*-times-medium-r-normal--*-240-*-*-*-*-*-*', 
            'fill'=>'brown')

$ctext_canvas.itembind('config', 'Enter', proc{textEnter $ctext_canvas})
$ctext_canvas.itembind('config', 'Leave', 
                       proc{$ctext_canvas\
                             .itemconfigure('current', 
                                            'fill'=>$textConfigFill)})

$textConfigFill = ''

def textEnter(w)
  $textConfigFill = (w.itemconfiginfo 'current', 'fill')[4]
  w.itemconfigure 'current', 'fill', 'black'
end

def textInsert(w, string)
  return if string == ""
  begin
    $ctag_text.dchars 'sel.first', 'sel.last'
  rescue
  end
  $ctag_text.insert 'insert', string
end

def textPaste(w, pos)
  begin
    $ctag_text.insert pos, TkSelection.get
  rescue
  end
end

def textB1Press(w,x,y)
  w.icursor 'current', "@#{x},#{y}"
  w.itemfocus 'current'
  w.focus
  w.select_from 'current', "@#{x},#{y}"
end

def textB1Move(w,x,y)
  w.select_to 'current', "@#{x},#{y}"
end

def textBs(w)
  begin
    $ctag_text.dchars 'sel.first', 'sel.last'
  rescue
    char = $ctag_text.index('insert').to_i - 1
    $ctag_text.dchars(char) if char >= 0
  end
end

def textDel(w)
  begin
    $ctag_text.dchars 'sel.first', 'sel.last'
  rescue
    $ctag_text.dchars 'insert'
  end
end


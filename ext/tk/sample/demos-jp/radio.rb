#
# radiobutton widget demo (called by 'widget')
#

# toplevel widget ��¸�ߤ���к������
if defined?($radio_demo) && $radio_demo
  $radio_demo.destroy 
  $radio_demo = nil
end

# demo �Ѥ� toplevel widget ������
$radio_demo = TkToplevel.new {|w|
  title("Radiobutton Demonstration")
  iconname("radio")
  positionWindow(w)
}

# label ����
msg = TkLabel.new($radio_demo) {
  font $font
  wraplength '4i'
  justify 'left'
  text "���ˤ�2�ĤΥ饸���ܥ��󥰥롼�פ�ɽ������Ƥ��ޤ����ܥ���򥯥�å�����ȡ����Υܥ�����������Υ��롼�פ�������򤵤�ޤ����ƥ��롼�פ��Ф��Ƥ��Υ��롼�פ���ΤɤΥܥ������򤵤�Ƥ��뤫�򼨤��ѿ���������Ƥ��Ƥ��ޤ������ߤ��ѿ����ͤ򸫤�ˤϡ��ѿ����ȡץܥ���򥯥�å����Ƥ���������"
}
msg.pack('side'=>'top')

# �ѿ�����
size = TkVariable.new
color = TkVariable.new

# frame ����
TkFrame.new($radio_demo) {|frame|
  TkButton.new(frame) {
    #text 'λ��'
    text '�Ĥ���'
    command proc{
      tmppath = $radio_demo
      $radio_demo = nil
      $showVarsWin[tmppath.path] = nil
      tmppath.destroy
    }
  }.pack('side'=>'left', 'expand'=>'yes')

  TkButton.new(frame) {
    text '�����ɻ���'
    command proc{showCode 'radio'}
  }.pack('side'=>'left', 'expand'=>'yes')

  TkButton.new(frame) {
    text '�ѿ�����'
    command proc{
      showVars($radio_demo, ['size', size], ['color', color])
    }
  }.pack('side'=>'left', 'expand'=>'yes')
}.pack('side'=>'bottom', 'fill'=>'x', 'pady'=>'2m')

# frame ����
f_left = TkFrame.new($radio_demo)
f_right = TkFrame.new($radio_demo)
f_left.pack('side'=>'left', 'expand'=>'yes', 'padx'=>'.5c', 'pady'=>'.5c')
f_right.pack('side'=>'left', 'expand'=>'yes', 'padx'=>'.5c', 'pady'=>'.5c')

# radiobutton ����
[10, 12, 18, 24].each {|sz|
  TkRadioButton.new(f_left) {
    text "�ݥ���ȥ����� #{sz}"
    variable size
    relief 'flat'
    value sz
  }.pack('side'=>'top', 'pady'=>2, 'anchor'=>'w')
}

['��', '��', '��', '��', '��', '��'].each {|col|
  TkRadioButton.new(f_right) {
    text col
    variable color
    relief 'flat'
    value col.downcase
  }.pack('side'=>'top', 'pady'=>2, 'anchor'=>'w')
}


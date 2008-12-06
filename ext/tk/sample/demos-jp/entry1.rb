#
# entry (no scrollbars) widget demo (called by 'widget')
#

# toplevel widget ��¸�ߤ���к������
if defined?($entry1_demo) && $entry1_demo
  $entry1_demo.destroy 
  $entry1_demo = nil
end

# demo �Ѥ� toplevel widget ������
$entry1_demo = TkToplevel.new {|w|
  title("Entry Demonstration (no scrollbars)")
  iconname("entry1")
  positionWindow(w)
}

# label ����
msg = TkLabel.new($entry1_demo) {
  font $font
  wraplength '5i'
  justify 'left'
  text "3����ΰۤʤ륨��ȥ꤬ɽ������Ƥ��ޤ���ʸ�������Ϥ���ˤϥݥ��󥿤���äƹԤ�������å����Ƥ��饿���פ��Ƥ���������ɸ��Ū��Motif���Խ���ǽ����Emacs�Υ����Х���ɤȤȤ�ˡ����ݡ��Ȥ���Ƥ��ޤ����㤨�С��Хå����ڡ����ȥ���ȥ���-H�ϥ�������κ���ʸ�����������ǥ꡼�ȥ����ȥ���ȥ���-D�ϥ�������α�¦��ʸ���������ޤ���Ĺ�᤮�ƥ�����ɥ��������ڤ�ʤ���Τϡ��ޥ����Υܥ���2�򲡤����ޤޥɥ�å����뤳�Ȥǥ������뤵���뤳�Ȥ��Ǥ��ޤ������ܸ�����Ϥ���Τϥ���ȥ���-�Хå�����å���Ǥ���kinput2��ư���Ƥ�������Ϥ��뤳�Ȥ��Ǥ��ޤ���"
}
msg.pack('side'=>'top')

# frame ����
TkFrame.new($entry1_demo) {|frame|
  TkButton.new(frame) {
    #text 'λ��'
    text '�Ĥ���'
    command proc{
      tmppath = $entry1_demo
      $entry1_demo = nil
      tmppath.destroy
    }
  }.pack('side'=>'left', 'expand'=>'yes')

  TkButton.new(frame) {
    text '�����ɻ���'
    command proc{showCode 'entry1'}
  }.pack('side'=>'left', 'expand'=>'yes')
}.pack('side'=>'bottom', 'fill'=>'x', 'pady'=>'2m')

# entry ����
e1 = TkEntry.new($entry1_demo, 'relief'=>'sunken')
e2 = TkEntry.new($entry1_demo, 'relief'=>'sunken')
e3 = TkEntry.new($entry1_demo, 'relief'=>'sunken')
[e1,e2,e3].each{|w| w.pack('side'=>'top', 'padx'=>10, 'pady'=>5, 'fill'=>'x')}

# ���������
e1.insert(0, '�����')
e2.insert('end', "���Υ���ȥ�ˤ�Ĺ��ʸ�������äƤ��ơ�")
e2.insert('end', "Ĺ�����ƥ�����ɥ��ˤ������ڤ�ʤ��Τǡ�")
e2.insert('end', "�ºݤν꽪��ޤǸ���ˤϥ������뤵���ʤ����")
e2.insert('end', "�ʤ�ʤ��Ǥ��礦��")


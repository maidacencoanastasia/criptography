const
  ABC = '��������������������������������';
  
begin
  var s0 := ReadLnString ('������� ������:');
  var  n := ReadLnInteger('�������� �����:');
  var s1 := ''; // ��� ����� ���������
  foreach var c : Char in s0 do // ��� ������� ������� �������� ������
    if ABC.IndexOf(c) < 0 then // ������ ������� ��� � ��������
      s1 += c // ������� ������ �������� ��� � ���������
    else // ���� ����� ������ � ��������
      begin
        var p := (ABC.Length + ABC.IndexOf(c) + n) mod ABC.Length + 1; // ������� �������������� �������
        s1 += ABC[p]; // ������������� ������ � ������ ����������
      end;
  WriteLn('������������� ���������: ', s1);
end.
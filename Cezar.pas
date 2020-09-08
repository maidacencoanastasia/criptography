const
  ABC = 'абвгдеёжзийклмнопрстуфхцчшщъыьэюя';
  
begin
  var s0 := ReadLnString ('Введите строку:');
  var  n := ReadLnInteger('Ключевое число:');
  var s1 := ''; // это будет результат
  foreach var c : Char in s0 do // для каждого символа исходной строки
    if ABC.IndexOf(c) < 0 then // такого символа нет в алфавите
      s1 += c // поэтому просто перенесём его в результат
    else // есть такой символ в алфавите
      begin
        var p := (ABC.Length + ABC.IndexOf(c) + n) mod ABC.Length + 1; // позиция зашифрованного символа
        s1 += ABC[p]; // зашифрованный символ в строку результата
      end;
  WriteLn('Зашифрованное сообщение: ', s1);
end.
Program insertsort;
const
  TAM = 100;
type
  Tdado = integer;
  Tvet=array[1..TAM] of Tdado;
var
  valor:Tvet;
procedure troca(var valor1, valor2:Tdado);
var
  aux:Tdado;
begin
  aux:= valor1;
  valor1 := valor2;
  valor2 := aux;
end;
procedure inserir(var valores:Tvet);
var
  contador:Tdado;
begin
  for contador:= 1 to TAM do valores[contador] := random(30);
end;

procedure exibir(valores:Tvet);
var
  contador:Tdado;
begin
  for contador:= 1 to TAM do write(valores[contador],'  ');
  writeln;
end;

procedure insertsort(var valores:Tvet);
var
  contador, contador2:Tdado;
  aux:Tdado;
begin
  for contador := 2 to TAM do
  begin
  	aux := valores[contador];
    contador2 := (contador - 1);
    while (contador2 > 0) do
    begin
      if (aux < valores[contador2]) then troca(valores[contador2],valores[contador2+1]);
      contador2 := contador2 - 1;    
    end;
	end;  
end;
begin
 inserir(valor);
 writeln('os valores do vetor são');
 exibir(valor);
 insertsort(valor);
 writeln('os valores ordenados são');
 exibir(valor);

 readln;

end.
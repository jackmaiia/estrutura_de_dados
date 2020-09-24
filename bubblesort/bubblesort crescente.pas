program bubble;
const
  TAM = 100;
type
  Tdado = integer;
  Tvet=array[1..TAM] of Tdado;
var
  valor:Tvet;
  testetroca,testecompara:Tdado;
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
  for contador:= 1 to TAM do valores[contador] := contador;
end;

procedure exibir(valores:Tvet);
var
  contador:Tdado;
begin
  for contador:= 1 to TAM do write(valores[contador],'  ');
  writeln;
end;

procedure bubblesort(var valores:Tvet);
var
  contador, contador2:Tdado;
begin
  for contador:= 1 to (TAM-1) do
    for contador2 := 1 to (TAM - contador) do
    begin
      testecompara:= testecompara +1;
      if valores[contador2]> valores[contador2 + 1] then
        begin
        		testetroca := testetroca + 1;
            troca(valores[contador2],valores[contador2 + 1]);
        end;
    end;
end;
begin
  testecompara := 0;
  testetroca := 0;
  inserir(valor);
  writeln('os valores do vetor são');
  exibir(valor);
  bubblesort(valor);
  writeln('os valores ordenados são');
  exibir(valor);
	writeln ('comparacoes ',testecompara,' trocas ',testetroca);
  readln;

end.

Program selection;
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
	testetroca := testetroca + 1;
  aux:= valor1;
  valor1 := valor2;
  valor2 := aux;
end;
procedure inserir(var valores:Tvet);
var
  contador:Tdado;
begin
  for contador:= 1 to TAM do  valores[contador] := contador;
end;

procedure exibir(valores:Tvet);
var
  contador:Tdado;
begin
  for contador:= 1 to TAM do write(valores[contador],'  ');
  writeln;
end;

procedure selectionsort(var valores:Tvet);
var
  contador, contador2:Tdado;
  Pmenor:Tdado;
begin
  for contador:= 1 to TAM-1 do
  begin
  	Pmenor := contador;
    for contador2 := (contador +1) to TAM do
    begin
    	testecompara := testecompara + 1;
      if valores[contador2] < valores[Pmenor] then
			begin
				Pmenor := contador2;
			end;
    end;
    troca(valores[contador],valores[Pmenor]);
  end;
end;
begin
  testetroca := 0;
  testecompara := 0;
	inserir(valor);
  writeln('os valores do vetor são');
  exibir(valor);
  selectionsort(valor);
  writeln('os valores ordenados são');
  exibir(valor);
  writeln('comparacoes ',testecompara,' trocas ',testetroca);
  readln;

end.
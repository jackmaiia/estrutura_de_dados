program shell;
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
  aux:Tdado;
begin
	aux := TAM;
  for contador:= 1 to TAM do
	begin
	 valores[contador] := aux;
	 aux := aux -1;
	end;
end;

procedure exibir(valores:Tvet);
var
  contador:Tdado;
begin
  for contador:= 1 to TAM do write(valores[contador],'  ');
  writeln;
end;
function gapp:integer;
var
	gap:Tdado;
begin
	gap := 1;
	while gap < TAM do
	begin
	  gap := (gap*3)+1;
	end;
	gapp:= gap div 3;
end;
procedure shellsort(var valores:Tvet);
var
  contador:Tdado;
  gap:Tdado;
begin
  gap := gapp;
  while (gap > 0)do
  begin
    for contador := 1 to 	(TAM-gap) do
    begin
    	testecompara := testecompara +1;
    	if valores[contador]>valores[contador+gap] then troca(valores[contador],valores[contador+gap]);
    end;
    gap := gap - 1;   
  end;
end;
begin
	testecompara := 0;
	testetroca := 0;
  inserir(valor);
  writeln('os valores do vetor são');
  exibir(valor);
  shellsort(valor);
  writeln('os valores ordenados são');
  exibir(valor);
  writeln('comparacoes ',testecompara,' trocas ',testetroca);

  readln;

end.

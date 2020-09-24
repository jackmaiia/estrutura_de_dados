Program quick ;
const
  TAM = 5;
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
  for contador:= 1 to TAM do valores[contador] := random(100);
end;

procedure exibir(valores:Tvet);
var
  contador:Tdado;
begin
  for contador:= 1 to TAM do write(valores[contador],'  ');
  writeln;
end;
{
quick da forma certa
if fim > ini em todo procedimento
i := ini
j := fim
escolhe o pivo (preferencia olhando o emio)
repeat
while  >
anda pelo vetor procurando um cara que é < e para o i
while <
anda pelo vetor procurando um cara que é >  e para o j
quando terminar os while troca o i com o j
acaba do repeat testando se i=j
chama recursivamente quick pra esquerda
chama recursivamente quick para direita
acaba o if }
procedure quicksort(var vet:Tvet;ini,fim:Tdado);
var
	i,f:Tdado;
	pivot:Tdado;
	meio:Tdado;	
begin
	if ini < fim then
	begin
		i := ini;
		f := fim;
		meio := (ini+fim) div 2;
		pivot := vet[meio];
		repeat
			writeln('o valor de i agora é ',i);
			writeln('o valor de f agora é ',f);
			writeln(' o pivot vale ',pivot);
			while vet[i] < pivot do
			begin
				writeln(vet[i],' é menor que ',pivot,' sendo assim, o valor de i = ',i,' será somado +1 ficando ',i+1); 
				i := i + 1;
			end;
			while vet[f] > pivot do
			begin
				writeln(vet[f],' é maior que ',pivot,' sendo assim, o valor de f = ',f,' será subtraido -1 ficando ',f-1);
				f := f - 1;
			end;
			if (i <= f) then
		  begin
					troca (vet[i],vet[f]);
					i := i + 1;
					f := f - 1;
					writeln('foi trocado o valor da posicao ',i,' pelo valor da posicao ',f);
			end;
		  exibir(vet);
		until(i > f);
	  if f > ini then quicksort(vet,ini,f);
	  if i < fim then quicksort(vet,i,fim);
	end else writeln(' o valor de fim ',fim,' não é maior que o de inicio ',ini,' sendo assim não será executada nenhuma acao por enquanto');
end;
Begin
	inserir(valor);
	writeln;
	exibir(valor);
	quicksort(valor,1,TAM);
	writeln;
	exibir(valor);
	readln;
	
  
End.            	
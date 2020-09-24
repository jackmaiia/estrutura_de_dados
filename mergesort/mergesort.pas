program merg;
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
  for contador:= 1 to TAM do valores[contador] := TAM - contador;
end;

procedure exibir(valores:Tvet);
var
  contador:Tdado;
begin
  for contador:= 1 to TAM do write(valores[contador],'  ');
  writeln;
end;
procedure merge(var vet:Tvet; ini,meio,fim:Tdado);
var
	aux:Tvet;
	ini1,ini2:Tdado;
	tamanho:Tdado;
	cont:Tdado;
	fim1,fim2:boolean;
begin
	
	ini1 := ini; // marca o inicio do primeiro vetor que vai de ini1 até meio
	ini2 := meio+1; // marca o inicio do segundo vetor  que vai de ini2 até fim
	fim1 := TRUE;
	fim2 := TRUE;
	writeln('primeiro vetor inicia em ',ini1,' e termina em ',meio);
	writeln('segundo vetor inicia em ',ini2,' e termina em ',fim);
	tamanho := (fim - ini) +1; //define o tamanho do vator auxiliar
	writeln('tamanho do vetor auxiliar é ',tamanho);
	for cont := 1 to tamanho do
	begin
		if (fim1  and fim2) then  // testa se algum dos vetores chegou ao seu limite evitando invadir o outro vetor
		begin		
			if (vet[ini1]< vet[ini2]) then
			begin
				aux[cont]:= vet[ini1];
				ini1 := ini1 + 1; // muda a marca de inicio, fazendo com que não utilize um mesmo valor de um vetor 2x
				writeln('ini1 agora e ',ini1);
			end else
				begin
					aux[cont] := vet[ini2];
					ini2 := ini2 + 1; // muda a marca de inicio, fazendo com que não utilize um mesmo valor de um vetor 2x
					writeln('ini2 agora e ',ini2);
				end;
				
				if (ini1 > meio) then fim1 := FALSE; // se o marcador chegar no seu limite muda pra FALSE
				if (ini2 > fim) then fim2 := FALSE;  // evitando entrar no if novamente
				
		end else // se algum dos vetores chegou no limite entra nesse else
			if (fim1) then  // testa se o primeiro vetor está disponivel
			begin
				aux[cont] := vet[ini1];
				ini1 := ini1 + 1;
				writeln('segundo vetor chegou no final ini1 agora é ',ini1);
			end else if (fim2) then  // testa se o segundo vetor está disponivel
				begin                                          	
					aux[cont] := vet[ini2];
					ini2 := ini2 + 1;
					writeln('primeiro vetor chegou no final ini2 agora é ',ini2);
		  	end;
		
	end;
	for cont := 1 to  tamanho do vet[ini+cont-1] := aux[cont];  // joga todo mundo de volta do auxiliar pro principal
	writeln('o vetor agora é');
	exibir(vet);
end;                                                          // porém ja ordenado
procedure mergesort(var vet:Tvet; ini:Tdado; fim:Tdado);
var
	meio:Tdado;
begin
	if ini < fim then
	begin
		meio := (ini + fim) div 2;
		writeln('meio agora é ',meio);
		mergesort(vet,ini,meio);  // ordena a primeira metade
		mergesort(vet,meio+1,fim); // ordena a segunda metade
		merge(vet, ini, meio, fim); // junta as metades
	end;
end;

Begin
	inserir(valor);
	exibir(valor);
	writeln;
	mergesort(valor,1,TAM);
	writeln;
	exibir(valor);
	readln;  
End.
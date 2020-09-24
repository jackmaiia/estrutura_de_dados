Program heaps;
uses
	crt;
const
	TAM=100;
type
	Tdado=integer;
	Tvet= array[1..TAM] of Tdado;
	Theap=record
  	dados:Tvet;
 		fim:Tdado;
				end;
var
	veto:Theap;
procedure troca(var dado1,dado2:Tdado);
var
	aux:Tdado;
begin
  aux := dado1;
  dado1 := dado2;
  dado2 := aux;
end;
procedure subir(var vet:Tvet; var po1:Tdado);
var
pai:Tdado;
begin
  pai := po1 div 2;
  if (vet[po1] <> 1) and (pai <> 0) then
  	if vet[po1]> vet[pai] then
  	begin
    	troca(vet[po1],vet[pai]);
    	subir(vet,pai);
  	end;
end;
procedure descer(var vet:Tvet;po1:Tdado);
var
	filho1,filho2:Tdado;
begin
  filho1 := po1 * 2;
  filho2 := (po1 * 2) + 1;
  if (filho1 < veto.fim) and (filho2 < veto.fim) then
  begin
    if (vet[po1] < vet[filho1]) or (vet[po1] < vet[filho2]) then
    	if vet[filho1]> vet[filho2] then
    		begin
      		troca(vet[po1],vet[filho1]);
      		descer(vet,filho1);
    		end else
    			if vet[filho2]> vet[filho1] then
    			begin
      			troca(vet[po1],vet[filho2]);
      			descer(vet,filho2);
    			end else
    				if vet[filho1] = vet[filho2] then
    				begin
      				troca(vet[po1],vet[filho1]);
      				descer(vet,filho1);
    				end;
  end else
  	if filho1 < veto.fim then
  		if (vet[po1] < vet[filho1]) then
  		begin
    		troca(vet[po1],vet[filho1]);
    		descer(vet,filho1);
  		end else
  			if filho1 < veto.fim then
  				if (vet[po1] < vet[filho2]) then
  				begin
    			troca(vet[po1],vet[filho2]);
    			descer(vet,filho2);
  				end;
end;
procedure inserir(var vet:Theap);
begin
  vet.dados[vet.fim]:= random(100);
  subir(vet.dados,vet.fim);
  vet.fim := vet.fim + 1;
end;

function retirar (var vet:Tvet):Tdado; //function retornando o valor retirado
begin
  veto.fim := veto.fim -1;
  troca(vet[1],vet[veto.fim]);
  descer(vet,1);
  retirar := vet[veto.fim];
end;

procedure montaheap(var Rvet:Theap); //nao é ordenação!!! é monta heap
var
	cont:Tdado;
	meio:Tdado;
begin
  meio := (Rvet.fim - 1) div 2;
  for cont := meio downto 1 do descer(Rvet.dados,cont);  
end;  

procedure exibir;
var
	cont:Tdado;
begin
	for cont := 1 to veto.fim-1 do write(veto.dados[cont],' ');
	writeln;
end;

procedure heapsort( var vet:Tvet);
var
	fim, cont:Tdado;
begin
	montaheap(veto);
	fim := veto.fim;
	for cont := 1 to fim-1 do retirar(veto.dados);
	veto.fim := fim;
end;
procedure menu;
var
	escolha:Tdado;
begin
	repeat
		writeln('[1] inserir, [2] retirar, [3] Heapsort, [4] exibir, [5] sair');
		readln(escolha);
		clrscr;
		if (escolha = 1) then inserir(veto) else
			if (escolha = 2) then writeln(retirar(veto.dados)) else
	    	if (escolha = 3) then heapsort(veto.dados) else
	      	if (escolha = 4) then exibir else
	readln;
	until(escolha = 5);
end;  
Begin
	veto.fim := 1;
	menu;
	
	readln;    
End.
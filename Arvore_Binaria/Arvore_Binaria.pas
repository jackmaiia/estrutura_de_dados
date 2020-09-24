Program arvorebinaria ;
uses
	crt;
type
	Tdado=integer;
	Tarv=^Telemento;
	Telemento=record
		esq,dir:Tarv;
		dados:Tdado;
			end;
var
	arv:Tarv;
function altura(var t:Tarv):integer;
var
	esq,dir:integer;
begin
	if (t = nil) then altura:= 0 else
	begin
		esq := altura(t^.esq);
		dir := altura(t^.dir);
		if esq > dir then altura := esq +1 else
			altura := dir +1;
	end;
end;
//============================================================
procedure rd(var ar:Tarv);
var
	u: Tarv;
begin
	u := ar^.esq;
	ar^.esq := u^.dir;
	u^.dir := ar;
	ar := u;
end;
//========================================================================================
procedure re(var ar:Tarv);
var
 u: Tarv; // Guarda endereço de "u".
begin
 u := ar^.dir;
 ar^.dir := u^.esq;
 u^.esq := ar;
 ar := u;
end;
//========================================================================================
procedure rde(var ar:Tarv);
begin
	rd(ar^.dir);
	re(ar);
end;
//========================================================================================
procedure rdd(var ar:Tarv);
begin
	re(ar^.esq);
	rd(ar);
end;
//========================================================================================

//=========================================================================================
procedure verifica(var t:Tarv);
var
	alt,alt2:integer;
begin
	alt := altura(t^.dir) - altura(t^.esq);
	if (alt < -1) or (alt > 1) then
	begin
		if (alt > 1) then
		begin
			alt2 := altura(t^.dir^.dir) - altura(t^.dir^.esq);
			if alt2 < 0 then rde(t) else re(t);
		end else
			begin
				alt2 := altura(t^.esq^.dir) - altura(t^.esq^.esq);
				if alt2 < 0 then rd(t) else rdd(t);				
			end;	
	end;
end;
//=========================================================================================	
procedure adiciona(var ar:Tarv;da:Tdado);
begin
	if (ar <> nil) then
	begin
		if (da) > (ar^.dados) then 
		begin
			adiciona(ar^.dir,da);
		end else adiciona (ar^.esq,da);
		
	end	else	begin
				new(ar);
				ar^.dados := da;
			end;
	verifica(ar);
end;
//=======================================================================================
procedure busca(var ar:Tarv;da:Tdado);
begin
	if (ar <> nil) then
	begin
	  if (da) > (ar^.dados) then busca(ar^.dir,da) else
			if da < (ar^.dados) then busca(ar^.esq,da) else
				if (ar^.dados = da) then writeln('elemento ',da,' encontrado em um dos elementos da arvore');	
	end else writeln ('processo de busca finalizado');
end;
//=======================================================================================
procedure simet(var ar:Tarv);
begin
	if(ar <> nil) then
	begin       	
		if (ar^.esq <> nil) then simet(ar^.esq);
		writeln(ar^.dados);
		if (ar^.dir <> nil) then simet(ar^.dir);
	end;
end;
//=======================================================================================
procedure pre(var ar:Tarv);
begin
	if (ar <> nil) then
	begin
		writeln(ar^.dados);
		if (ar^.esq <> nil) then pre(ar^.esq);
		if (ar^.dir <> nil) then pre(ar^.dir);
	end;
end;
//=======================================================================================
procedure pro(var ar:Tarv);
begin
	if (ar <> nil ) then
	begin
		if (ar^.esq <> nil) then pro(ar^.esq);
		if (ar^.dir <> nil) then pro(ar^.dir);
		writeln(ar^.dados);
	end;
end;
//=======================================================================================

procedure menu;
var
	leitura:integer;
	num_inserir,num_buscar:integer;
begin
	repeat
		writeln('digite a opção desejada:');
		writeln('[1] para inserir um numero');
	  writeln('[2] buscar um numero');
	  writeln('[3] exibir de forma simetrica');
	  writeln('[4] exibir de forma pre');
	  writeln('[5] exibir de forma pós');
	  writeln('[6] altura da arvore');
	  writeln('[7] sair');
	  
	  readln(leitura);
	  clrscr;
	  case leitura of
	  	1:begin
	  			writeln('digite o numero que deseja inserir');
	  			readln(num_inserir);
	  			adiciona(arv,num_inserir);
	  			clrscr;
	  		end;
	  	2:begin
	  			writeln('digite o numero que deseja procurar');
	  			readln(num_buscar);
	  			clrscr;
	  			busca(arv,num_buscar);
	  			readln;
	  			clrscr;
	  		end;
	    3:begin
	    		writeln('exibindo numero da forma simetrica');
					simet(arv);
					readln;
	  			clrscr;
				end;
			4:begin
	    		writeln('exibindo numero da forma pre');
					pre(arv);
					readln;
	  			clrscr;
				end;
			5:begin
	    		writeln('exibindo numero da forma pos');
					pro(arv);
					readln;
	  			clrscr;
				end;
			6:begin
					writeln (altura(arv));
					readln;
	  			clrscr;
	  		end;
	  end;  
	until(leitura=7);

end;	

Begin
	textbackground(white);
	clrscr;
	textcolor(black);
	menu;
	readln;  
End.
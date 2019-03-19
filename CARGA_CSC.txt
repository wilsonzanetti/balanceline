CREATE OR REPLACE PROCEDURE "CARGA_CSC" (qtd37 out number,qtd39 out number) is
/*
  Created by Alessandro Luiz Mamus - 11/03/2003 - 11:21 H
*/
  --Criação de um record que contém os campos que receberá os valores para a inserção na tabela
  type registro is record
  (
   handle NUMBER,
   lotacao Number,
   matricula NUMBER,
   dv varchar2(2),
   dep NUMBER,
   uf varchar2(6),
   matrdep Number,
   matrfunc Number,
   tipodep varchar2(6),
   nome varchar2(70),
   matriculaaux varchar2(15),
   dep2 varchar2(6)
  );
  RegAux registro; --variável do tipo record
  Arquivo UTL_FILE.FILE_TYPE; --variável do tipo arquivo
  Linha varchar2(1023);
  nhandle Number;
  textoaux varchar2(1023);
  vLoop smallint;
  vStringAux varchar(10);
  vStringAux2 varchar(10);
  VEndFile varchar(30);
  qt37 number;
  qt39 number;
  vDataAux date;
  vDia char(2);
  vMes char(2);
  vAno char(4);
begin
  execute immediate 'alter session set nls_date_format=''dd/mm/yyyy hh24:mi:ss'' ';
  --*******************************************************************************************
  --      Ler o arquivo texto gerado a partir do CSC e povoar a Tabela TCSC004 - MUNICÍPIOS
  --*******************************************************************************************
  -- Alterado por Helio Roberto 25-08-2009
  --Deletar a tabela TCSC004
  execute immediate ('DELETE FROM TCSC004');
  commit;
  --Variável do tipo arquivo que recebe o handle do arquivo real
  Arquivo:=utl_file.fopen('CARGA','csc004.txt','r');
  utl_file.get_line(Arquivo,linha);  --le o Header
  loop
  begin
       utl_file.get_line(Arquivo,linha);  --lê a linha
       textoaux:=linha;
       VEndFile:=substr(textoaux,29,17);
       if VEndFile='XXXXXXXXXXXXXXXXXXXXXXXXXXX' then -- final do arquivo - Trailler
         exit;
       end if;
       regaux.lotacao:=Substr(textoaux,1,5);
       regaux.uf:=Substr(textoaux,6,2);
       regaux.nome:=ltrim(rtrim(Substr(textoaux,8,28)));
       --inserção na tabela migfuncititular
     begin
        insert into TCSC004
        (CSC004WCODMUNI,CSC004WSGLUFYY,CSC004WNOMMUNI)
        values
        (regaux.lotacao,regaux.uf,regaux.nome);
        commit;
     exception
         when others then
         insert into migdetlogbenner
         (CODIGO,DATA,REGISTRO,OBSERVACAO)
         VALUES
         (1,sysdate,'TCSC004','ERRO AO Inserir registro na TCSC004');
         COMMIT;
     end;
    exception
        when no_data_found then   --quando nenhum dado for encontrado na leitura
          exit;
    end;
  end loop;
  --função que testa se o arquivo está aberto
  if utl_file.is_open(Arquivo) then
     utl_file.fclose(Arquivo); --fechar o arquivo
  end if;
  --*******************************************************************************************
  --      Ler o arquivo texto gerado a partir do CSC e povoar a Tabela TCSC005 - AGÊNCIAS
  --*******************************************************************************************
  -- Alterado por Helio Roberto 13-08-2009
  --Deletar a tabela TCSC005
  execute immediate ('DELETE FROM TCSC005');
  commit;
  --Variável do tipo arquivo que recebe o handle do arquivo real
  Arquivo:=utl_file.fopen('CARGA','csc005.txt','r');
  utl_file.get_line(Arquivo,linha);  --le o Header
  loop
  begin
       utl_file.get_line(Arquivo,linha);  --lê a linha
       textoaux:=linha;
       VEndFile:=substr(textoaux,29,27);
       if VEndFile='XXXXXXXXXXXXXXXXXXXXXXXXXXX' then -- final do arquivo - Trailler
         exit;
       end if;
       vStringAux2:=Substr(textoaux,1,5);
       regaux.nome:=ltrim(rtrim(Substr(textoaux,6,22)));
       regaux.uf:=Substr(textoaux,28,2);
       regaux.dep:=Substr(textoaux,30,5);
       regaux.tipodep:=Substr(textoaux,35,5);
       regaux.matriculaaux:=Substr(textoaux,40,10);
       Vstringaux:=Substr(textoaux,50,5);
       --inserção na tabela migfuncititular
      begin
       insert into TCSC005
       (CSC005WPRFAGEN,CSC005WNOMAGEN,CSC005WSGLUFYY,CSC005WCODMUNI,CSC005WPRFCSEC,CSC005WDMAATUA,CSC005WPRFGREC )
       values
       (vStringAux2,regaux.nome,regaux.uf,regaux.dep,regaux.tipodep,regaux.matriculaaux,vStringAux);
       commit;
      exception
         when others then
         insert into migdetlogbenner
         (CODIGO,DATA,REGISTRO,OBSERVACAO)
         VALUES
         (1,sysdate,'TCSC005','ERRO AO Inserir registro na TCSC005');
         commit;
      end;
    exception
        when no_data_found then   --quando nenhum dado for encontrado na leitura
          exit;
    end;
  end loop;
  --função que testa se o arquivo está aberto
  if utl_file.is_open(Arquivo) then
     utl_file.fclose(Arquivo); --fechar o arquivo
  end if;
  --*******************************************************************************************
  --      Ler o arquivo texto gerado a partir do CSC e povoar a Tabela TCSC002 - CESEC
  --*******************************************************************************************
  -- Alterado por Helio Roberto 25-08-2009
  --Deletar a tabela TCSC002
  execute immediate ('DELETE FROM TCSC002');
  commit;
  --Variável do tipo arquivo que recebe o handle do arquivo real
  Arquivo:=utl_file.fopen('CARGA','csc002.txt','r');
  utl_file.get_line(Arquivo,linha);  --le o Header
  loop
  begin
       utl_file.get_line(Arquivo,linha);  --lê a linha
       textoaux:=linha;
       VEndFile:=substr(textoaux,29,27);
       if VEndFile='XXXXXXXXXXXXXXXXXXXXXXXXXXX' then -- final do arquivo - Trailler
         exit;
       end if;
       vStringAux2:=Substr(textoaux,1,5);
       regaux.nome:=ltrim(rtrim(Substr(textoaux,6,22)));
       regaux.dep:=Substr(textoaux,28,5);
       regaux.matriculaaux:=Substr(textoaux,33,10);
       regaux.tipodep:=Substr(textoaux,43,5);
       regaux.dep2:=Substr(textoaux,49,5);
       Vstringaux:=Substr(textoaux,54,5);
       --inserção na tabela migfuncititular
      begin
       insert into TCSC002
       (CSC002WPRFCSEC,CSC002WNOMCSEC,CSC002WPRFCDIP,CSC002WDMAATUA,CSC002WVLRPLUS,CSC002WPRFCSECPROC,CSC002WPRFGREC)
       values
       (vStringAux2,regaux.nome,regaux.dep,regaux.matriculaaux,regaux.tipodep,regaux.dep2,vStringAux);
       commit;
      exception
         when others then
         insert into migdetlogbenner
         (CODIGO,DATA,REGISTRO,OBSERVACAO)
         VALUES
         (1,sysdate,'TCSC002','ERRO AO Inserir registro na TCSC002');
         commit;
      end;
    exception
        when no_data_found then   --quando nenhum dado for encontrado na leitura
          exit;
    end;
  end loop;
  --função que testa se o arquivo está aberto
  if utl_file.is_open(Arquivo) then
     utl_file.fclose(Arquivo); --fechar o arquivo
  end if;
  --*******************************************************************************************
  --      Ler o arquivo texto gerado a partir do CSC e povoar a Tabela MIGFUNCITITULAR
  --*******************************************************************************************
  --Deletar o arquivo MigfunciTitular
  execute immediate ('delete from migfuncititular');
  commit;
  --Variável do tipo arquivo que recebe o handle do arquivo real
  Arquivo:=utl_file.fopen('CARGA','benefic.txt','r');
  --loop para ler a linha do arquivo e inserir na tabela migfunctitular
  nhandle:=0;
  loop
    begin
       nhandle:=nhandle + 1;
       utl_file.get_line(Arquivo,linha);  --lê a linha
       textoaux:=linha;
       vLoop :=1;
       --atribuir os valores lidos a partir do arquivo texto para os campos do record type
       while (vloop <= 8)
       loop
           if (vLoop=1) then
              regaux.uf:=Substr(textoaux,1,instr(textoaux,','));
              --regaux.lotacao:=Substr(textoaux,1,instr(textoaux,','));
           elsif (vLoop=2) then
              regaux.matricula:=Substr(textoaux,1,instr(textoaux,','));
           elsif (vLoop=3) then
              regaux.dv:=Substr(textoaux,1,instr(textoaux,',')-1);
           elsif (vLoop=4) then
              regaux.dep:=Substr(textoaux,1,instr(textoaux,','));
           elsif (vLoop=5) then
              regaux.uf:=Substr(textoaux,1,instr(textoaux,','));
              if regaux.uf='""' then
                 regaux.uf:=null;
              else
                 regaux.uf:=substr(regaux.uf,2,2);
              end if;
           elsif (vLoop=6) then
              regaux.matrdep:=Substr(textoaux,1,instr(textoaux,','));
           elsif (vLoop=7) then
              regaux.matrfunc:=Substr(textoaux,1,instr(textoaux,','));
           else
              if textoaux='""' then
                 regaux.tipodep:=null;
              else
                 regaux.tipodep:=substr(textoaux,2,instr(textoaux,'"'));
              end if;
           end if;
           if vloop <> 8 then
              textoaux:=Substr(textoaux,instr(textoaux,',')+1,length(textoaux));
           end if;
           vloop:=vloop + 1;
       end loop;
       --inserção na tabela migfuncititular
       insert into migfuncititular
       (handle,lotacao,matricula,dv,dep,uf,matrdep,matrfunc,tipodep)
       values
       (nhandle,regaux.lotacao,regaux.matricula,regaux.dv,regaux.dep,regaux.uf,regaux.matrdep,
        regaux.matrfunc,regaux.tipodep);
       commit;
    exception
        when no_data_found then   --quando nenhum dado for encontrado na leitura
          exit;
    end;
  end loop;
  --função que testa se o arquivo está aberto
  if utl_file.is_open(Arquivo) then
     utl_file.fclose(Arquivo); --fechar o arquivo
  end if;
  --**********************************************************************************************
  --    Ler o Arquivo texto gerado a partir do RH e povoar a tabela MIGFUNC_SERVICOPROPRIO
  --**********************************************************************************************
  --Deletar o arquivo migfunc_servicoproprio
  execute immediate ('delete from migfunc_servicoproprio');
  commit;
  --Variável do tipo arquivo que recebe o handle do arquivo real
  Arquivo:=utl_file.fopen('CARGA','funcicassi.txt','r');
  loop
    begin
       utl_file.get_line(Arquivo,linha);  --lê a linha
       textoaux:=linha;
       regaux.matriculaaux:=Substr(textoaux,1,instr(textoaux,','));
       if regaux.matriculaaux='""' then
          regaux.matriculaaux:=null;
       else
          regaux.matriculaaux:=substr(regaux.matriculaaux,2,length(regaux.matriculaaux)-3);
       end if;
       textoaux:=Substr(textoaux,instr(textoaux,',')+2,length(textoaux));
       regaux.nome     :=substr(textoaux,1,instr(textoaux,'"')-1);
       --inserção na tabela migfuncititular
       insert into migfunc_servicoproprio
       (matricula,nome)
       values
       (regaux.matriculaaux,regaux.nome);
       commit;
    exception
        when no_data_found then   --quando nenhum dado for encontrado na leitura
          exit;
    end;
  end loop;
  --função que testa se o arquivo está aberto
  if utl_file.is_open(Arquivo) then
     utl_file.fclose(Arquivo); --fechar o arquivo
  end if;
  --*******************************************************************************************
  --                      Carregar as Diferenciais - TCSC037_DIFF/TCSC039_DIFF
  --*******************************************************************************************
  CARREGAR_DIFFS;
  --Chamada da procedure para atualizar os campos município e cep na TCSC039_DIFF e fazer o balance_line nas Dif's
  qt37:=0;
  qt39:=0;
  BALANCE_LINE_DIFF(qt37,qt39);
  qtd37:=qt37;
  qtd39:=qt39;
  update_sam_matricula_nomemae;
  ATUALIZARLOTACOES;  
end CARGA_CSC;
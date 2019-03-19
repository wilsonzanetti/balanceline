CREATE OR REPLACE PROCEDURE "ATUALIZARSECAOFAMILIA" (P_MIGRACAO VARCHAR) is
--Created by Alessandro Luiz Mamus - 21/03/2005
--Altera??o : 03/11/05 - Atualiza??o das lota??es para o contrato Dependentes Indiretos
         --FULL
         CURSOR CFULL is
         select f.handle FAMILIA,f.secao secaoF,sec.handle HSECAO
           from sam_beneficiario b
                join sam_familia f on b.familia=f.handle
                join tcsc039 t on b.matriculacassi=lpad(t.CSC039WMTRBENF,9,0)||lpad(t.CSC039WNRODEPY,2,0)
                join sam_contrato_secao sec on sec.codigo=t.csc039wnroscao and sec.contrato=f.contrato
         where f.contrato in (2,7) and ehtitular='S';
         --CURSOR PARA OS DEPENDENTES INDIRETOS E ASSOCIADOS
         CURSOR C_DEPENDENTES_IND IS
         SELECT HANDLE
           FROM SAM_BENEFICIARIO
         WHERE CONTRATO IN (7,2) AND DATACANCELAMENTO IS NULL AND EHTITULAR='S';
         --DIFERENCIAL
         CURSOR CDIFF is
         select f.handle FAMILIA,f.secao secaoF,sec.handle HSECAO
           from sam_beneficiario b
                join sam_familia f on b.familia=f.handle
                join tcsc039_diff t on b.matriculacassi=lpad(t.CSC039WMTRBENF,9,0)||lpad(t.CSC039WNRODEPY,2,0)
                join sam_contrato_secao sec on sec.codigo=t.csc039wnroscao and sec.contrato=f.contrato
         where f.contrato in (2,30,7);
   P_count number;
   P_MAXSECAO NUMBER;
--   P_QTD NUMBER;
   P_SEQUENCE VARCHAR(10);
   NLOTACAO NUMBER;
   NFAMILIA NUMBER;
begin
   execute immediate 'alter session set nls_date_format=''dd/mm/yyyy hh24:mi:ss'' ';
   --CRIA??O DAS LOTA??ES QUE N?O EXISTEM NA SOCPRO - INCLUS?O NA SAM_CONTRATO_LOTACAO - 03/11/05
      INSERT INTO SAM_CONTRATO_LOTACAO(
             HANDLE,
             Z_GRUPO,
             DESCRICAO,
             CODIGO,
             DV,
             LOTACAOEXTERNA,
             CONTRATO,
             CESEC,
             ESTADO)      
      SELECT SEQ_CONTRLOTAC.NEXTVAL,
             NULL,
             AG.NOME,
             AG.AGENCIA,
             AG.DV,
             NULL,
             2,
             NULL,
             AG.Estado
        FROM SFN_AGENCIA AG
      WHERE NOT EXISTS
            (SELECT  1
               FROM SAM_CONTRATO_LOTACAO LOT
              WHERE LOT.CODIGO=(AG.AGENCIA) AND CONTRATO=2)
        and AG.BANCO = 1; --BB
              --WHERE LOT.CODIGO=TO_NUMBER(AG.AGENCIA) AND CONTRATO=2);
      COMMIT;
      INSERT INTO SAM_CONTRATO_LOTACAO(
             HANDLE,
             Z_GRUPO,
             DESCRICAO,
             CODIGO,
             DV,
             LOTACAOEXTERNA,
             CONTRATO,
             CESEC,
             ESTADO)
      SELECT SEQ_CONTRLOTAC.NEXTVAL,
             NULL,
             AG.NOME,
             AG.AGENCIA,
             AG.DV,
             NULL,
             7,
             NULL,
             AG.Estado
        FROM SFN_AGENCIA AG
      WHERE NOT EXISTS
            (SELECT '1'
               FROM SAM_CONTRATO_LOTACAO LOT
              WHERE LOT.CODIGO=(AG.AGENCIA) AND CONTRATO=7)
        and AG.BANCO = 1; --BB
              --WHERE LOT.CODIGO=TO_NUMBER(AG.AGENCIA) AND CONTRATO=7);
      COMMIT;
      INSERT INTO SAM_CONTRATO_LOTACAO(
             HANDLE,
             Z_GRUPO,
             DESCRICAO,
             CODIGO,
             DV,
             LOTACAOEXTERNA,
             CONTRATO,
             CESEC,
             ESTADO)
      SELECT SEQ_CONTRLOTAC.NEXTVAL,
             NULL,
             AG.NOME,
             AG.AGENCIA,
             AG.DV,
             NULL,
             30,
             NULL,
             AG.Estado
        FROM SFN_AGENCIA AG
      WHERE NOT EXISTS
            (SELECT '1'
               FROM SAM_CONTRATO_LOTACAO LOT
              WHERE LOT.CODIGO=(AG.AGENCIA) AND CONTRATO=30)
        and AG.BANCO = 1; --BB
              --WHERE LOT.CODIGO=TO_NUMBER(AG.AGENCIA) AND CONTRATO=30);
      COMMIT;
   --Verificar se o sequence existe
   P_SEQUENCE:=NULL;
   SELECT SEQUENCE_NAME INTO P_SEQUENCE
     FROM ALL_SEQUENCES
    WHERE SEQUENCE_NAME like 'SEQ_SECAO';
   --SELECIONA O MAX HANDLE DA TABELA SAM_CONTRATO_SECAO
   SELECT MAX(HANDLE) INTO P_MAXSECAO
     FROM SAM_CONTRATO_SECAO;
   IF P_SEQUENCE IS NOT NULL THEN --O sequence j? existe
      execute immediate('DROP SEQUENCE SEQ_SECAO');
   END IF;
   execute immediate('CREATE SEQUENCE SEQ_SECAO START WITH ' || to_char(P_MAXSECAO+1) || ' INCREMENT BY 1 NOORDER NOCYCLE CACHE 100');
   EXECUTE IMMEDIATE ('DELETE FROM TB_NOVA_SECAO');
   INSERT INTO TB_NOVA_SECAO
    SELECT CSC039WNROSCAO FROM TCSC039
            WHERE CSC039WNROSCAO > 0 AND NOT EXISTS (SELECT '1'
            FROM SAM_CONTRATO_SECAO
            WHERE CODIGO=CSC039WNROSCAO AND CONTRATO = 2)
            GROUP BY CSC039WNROSCAO;
     INSERT INTO SAM_CONTRATO_SECAO
     SELECT SEQ_SECAO.NEXTVAL, null, 2, TO_CHAR(NU_SECAO), NU_SECAO FROM TB_NOVA_SECAO;
     commit;
   EXECUTE IMMEDIATE ('DELETE FROM SOCPRO.TB_NOVA_SECAO');
   INSERT INTO TB_NOVA_SECAO
    SELECT CSC039WNROSCAO FROM TCSC039
           WHERE CSC039WNROSCAO > 0 AND NOT EXISTS (SELECT '1'
           FROM SAM_CONTRATO_SECAO
           WHERE CODIGO=CSC039WNROSCAO AND CONTRATO = 30)
           GROUP BY CSC039WNROSCAO;
   INSERT INTO SAM_CONTRATO_SECAO
   SELECT SEQ_SECAO.NEXTVAL, null, 30, TO_CHAR(NU_SECAO), NU_SECAO FROM TB_NOVA_SECAO;
   COMMIT;
   EXECUTE IMMEDIATE ('DELETE FROM TB_NOVA_SECAO');
   INSERT INTO TB_NOVA_SECAO
    SELECT CSC039WNROSCAO FROM TCSC039
           WHERE CSC039WNROSCAO > 0 AND NOT EXISTS (SELECT '1'
           FROM SAM_CONTRATO_SECAO
           WHERE CODIGO=CSC039WNROSCAO AND CONTRATO = 7)
           GROUP BY CSC039WNROSCAO;
   INSERT INTO SAM_CONTRATO_SECAO
   SELECT SEQ_SECAO.NEXTVAL, null, 7, TO_CHAR(NU_SECAO), NU_SECAO FROM TB_NOVA_SECAO;
   COMMIT;
   P_Count:=0;
   IF P_MIGRACAO='F' THEN --FULL
        FOR CAUX IN CFULL LOOP
            update sam_familia
               set secao=caux.hsecao
             where handle=caux.familia;
             P_Count:=P_Count + 1;
             if P_count = 500 then
                commit;
                p_count:=0;
             end if;
        END LOOP;
        --ATUALIZAR AS LOTA??ES DOS DEPENDENTES INDIRETOS
        P_Count:=0;
        FOR CAUX1 IN C_DEPENDENTES_IND LOOP
          begin
           select F.HANDLE,
                  C.HANDLE
                  INTO
                  NFAMILIA,
                  NLOTACAO
             from sam_beneficiario b
                  JOIN SAM_FAMILIA F ON F.HANDLE=B.HANDLE
                  join tcsc039 a on b.matriculacassi=lpad(a.CSC039WMTRBENF,9,0)||lpad(a.CSC039WNRODEPY,2,0)
                  join sam_contrato_lotacao c on C.CODIGO=TO_NUMBER(SUBSTR(a.CSC039WENDTRAB,1,LENGTH(a.CSC039WENDTRAB)-1)) AND
                                                 C.DV= SUBSTR(a.CSC039WENDTRAB,LENGTH(a.CSC039WENDTRAB),1) and c.contrato=b.contrato
            where B.HANDLE=CAUX1.HANDLE AND B.EHTITULAR='S';
            IF NLOTACAO IS NOT NULL THEN
                  UPDATE SAM_FAMILIA
                     SET LOTACAO=NLOTACAO
                   WHERE HANDLE=NFAMILIA;
                   P_Count:=P_Count + 1;
                   if P_count = 500 then
                      commit;
                      p_count:=0;
                   end if;
            END IF;
           exception
             when others then
               insert into migdetlogbenner
              (CODIGO,DATA,REGISTRO,OBSERVACAO)
               VALUES
              (1,sysdate,'PROCEDURE ATUALIZARSECAOFAMILIA','Erro ao atualizar o campo lota??o da fam?lia' || +TO_CHAR(NFAMILIA));
               COMMIT;
           end;
        END LOOP;
        COMMIT;
    ELSE  --DIFF
        FOR CAUX IN CDIFF LOOP
            update sam_familia
               set secao=caux.hsecao
             where handle=caux.familia;
             P_Count:=P_Count + 1;
             if P_count = 500 then
                commit;
                p_count:=0;
             end if;
        END LOOP;
    END IF;
    commit;
end atualizarSecaoFamilia;

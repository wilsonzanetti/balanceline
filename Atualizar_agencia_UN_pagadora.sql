create or replace procedure Atualizar_agencia_UN_pagadora is
--Criado por Alessandro Luiz Mamus - 07/03/2006 - referente ao Service Call 111138
--Alteardo no dia 19/07/07 - inclus�o da cl�usula "and banco=1" no select da ag�ncia
 CURSOR C_CCUnPagador IS
      select sb.handle handle_benef,
             scf.handle handle_contafin,
             1 banco,
             case fl.handle --antes do h�fen - c�digo da ag�ncia c/ 4 d�gitos mais o DV - ap�s o h�fen -conta-corrente mais o DV
                  when 2 then '15237-187712'
                  when 3 then '30538-4041356'
                  when 4 then '29718-6792X'
                  when 5 then '35157-72389'
                  when 6 then '33073-405881X'
                  when 7 then '37907-97748'
                  when 8 then '34835-314013X'
                  when 9 then '1611X-171948'
                  when 10 then '34894-108219'
                  when 11 then '42110-1108352'
                  when 12 then '33251-7344X'
                  when 13 then '16861-7538340'
                  when 14 then '32778-1054325'
                  when 15 then '28053-173894'
                  when 16 then '32190-51934'
                  when 17 then '15180-1909002'
                  when 18 then '04359-340081'
                  when 19 then '00221-77887'
                  when 20 then '01023-99801X'
                  when 21 then '27960-1055879'
                  when 22 then '31747-701550X'
                  when 23 then '00175-999008'
                  when 24 then '33243-9564160'
                  else null
             end ag_e_dv_contacorrente_E_dv,
             scf.agencia agencia_benef,
             fl.nome ccnome
       from sam_beneficiario sb
            join sfn_contafin scf on scf.beneficiario=sb.handle
            join filiais fl on fl.handle=sb.filialcusto
      where sb.contrato=24 and sb.dataadesao >= '01/12/2005' and
            scf.tabgeracaorec=3 and scf.tabgeracaopag=3 and datacancelamento is null
            and sb.filialcusto < 25;
   nu_agencia_pagadora number:=0;
begin
   execute immediate 'alter session set nls_date_format=''dd/mm/yyyy hh24:mi:ss'' ';
   FOR CAUX IN C_CCUnPagador loop
       --armazena o handle da ag�ncia da unidade pagadora
       select handle into nu_agencia_pagadora
         from sfn_agencia
        where agencia=substr(caux.ag_e_dv_contacorrente_E_dv,1,4)
          and banco=1
          and situacao = 'A';
       --verifica se o handle da ag�ncia da unidade pagadora � diferente da ag�ncia do benef
       if ((nu_agencia_pagadora <> caux.agencia_benef) or (caux.agencia_benef is null)) then
          update sfn_contafin
             set agencia        =nu_agencia_pagadora,
                 contacorrente =substr(caux.ag_e_dv_contacorrente_E_dv,
                                       Instr(caux.ag_e_dv_contacorrente_E_dv,'-')+1,
                                       length(caux.ag_e_dv_contacorrente_E_dv) - (Instr(caux.ag_e_dv_contacorrente_E_dv,'-')+1)),
                            dv =substr(caux.ag_e_dv_contacorrente_E_dv,length(caux.ag_e_dv_contacorrente_E_dv),1),
                 tabgeracaopag =1,
                 banco         =1,
                 ccnome        =caux.ccnome
           where handle=caux.handle_contafin;
           commit;
       end if;
   end loop;
end Atualizar_agencia_UN_pagadora;